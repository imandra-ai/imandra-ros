"""imandrabotpackage setup file."""

from setuptools import setup


package_name = 'imandrabot'
data_files = []
data_files.append(('share/ament_index/resource_index/packages', [
    'resource/' + package_name
]))
data_files.append(('share/' + package_name + '/launch', [
    'launch/robot_launch.py',
]))
data_files.append(('share/' + package_name + '/worlds', [
    'worlds/world.wbt'
]))
data_files.append(('share/' + package_name + '/protos', [
    'protos/imandrabot.proto'
]))
data_files.append(('share/' + package_name + '/resource', [
    'resource/imandrabot.urdf',
    'resource/ros2_control.yml'
]))
data_files.append(('share/' + package_name, [
    'package.xml'
]))


setup(
    name=package_name,
    version='0.0.2',
    packages=[package_name],
    data_files=data_files,
    install_requires=['setuptools', 'launch'],
    zip_safe=True,
    author='Konstantin Kanishchev',
    author_email='kostya@imandra.ai',
    maintainer='Imandra',
    maintainer_email='skostya@imandra.ai',
    keywords=['ROS', 'Webots', 'Robot', 'Imandra', 'Formal Verification'],
    classifiers=[
        'Intended Audience :: Developers',
        'Programming Language :: Python',
        'Topic :: Software Development',
    ],
    description='Imandra verified ROS2 node',
    license='TODO',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'imandra_zmq_proxy = imandrabot.imandra_zmq_proxy:main'
        ],
        'launch.frontend.launch_extension': ['launch_ros = launch_ros']
    }
)
