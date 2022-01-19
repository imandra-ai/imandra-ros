import os
import pathlib
import launch
from launch.substitutions import LaunchConfiguration
from launch.actions import DeclareLaunchArgument
from launch.substitutions.path_join_substitution import PathJoinSubstitution
from launch_ros.actions import Node
from launch import LaunchDescription
from ament_index_python.packages import get_package_share_directory
from webots_ros2_driver.webots_launcher import WebotsLauncher


def generate_launch_description():
    package_dir = get_package_share_directory('imandrabot')
    world = LaunchConfiguration('world')
    robot_description = pathlib.Path(os.path.join(package_dir, 'resource', 'imandrabot.urdf')).read_text()
    ros2_control_params = os.path.join(package_dir, 'resource', 'ros2_control.yml')
    use_sim_time = LaunchConfiguration('use_sim_time', default=True)

    webots = WebotsLauncher(
        world=PathJoinSubstitution([package_dir, 'worlds', world])
    )

    controller_manager_timeout = ['--controller-manager-timeout', '50']
    controller_manager_prefix = 'python.exe' if os.name == 'nt' else ''
    diffdrive_controller_spawner = Node(
        package='controller_manager',
        executable='spawner.py',
        output='screen',
        prefix=controller_manager_prefix,
        arguments=['diffdrive_controller'] + controller_manager_timeout,
        parameters=[
            {'use_sim_time': use_sim_time},
        ],
    )

    joint_state_broadcaster_spawner = Node(
        package='controller_manager',
        executable='spawner.py',
        output='screen',
        prefix=controller_manager_prefix,
        arguments=['joint_state_broadcaster'] + controller_manager_timeout,
        parameters=[
            {'use_sim_time': use_sim_time},
        ],
    )

    webots_driver = Node(
        package='webots_ros2_driver',
        executable='driver',
        output='screen',
        parameters=[
            {'robot_description': robot_description,
             'use_sim_time': use_sim_time},
            ros2_control_params
        ],
        remappings=[
            ('/diffdrive_controller/cmd_vel_unstamped', '/cmd_vel'),
        ]
    )

    imandra_proxy = Node(
        package='imandrabot',
        executable='imandra_zmq_proxy',
        output='screen',
        parameters=[{'use_sim_time': use_sim_time}]
    )


    return LaunchDescription([
        DeclareLaunchArgument(
            'world',
            default_value='world.wbt',
            description='Choose world'
        ),
        webots,
        diffdrive_controller_spawner,
        joint_state_broadcaster_spawner,
        webots_driver,
        imandra_proxy,

        # This action will kill all nodes once the Webots simulation has exited
        launch.actions.RegisterEventHandler(
            event_handler=launch.event_handlers.OnProcessExit(
                target_action=webots,
                on_exit=[launch.actions.EmitEvent(event=launch.events.Shutdown())],
            )
        )
    ])
