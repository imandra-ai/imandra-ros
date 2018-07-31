
![](docs/images/Imandrabot.png "Imandra ROS")

*From self-driving cars to medical surgeons, robots have become ubiquitous. Ensuring they operate safely and correctly is evermore important. The most popular middleware for robotics is the open-sourced Robot OS. We are work on developing an Imandra/OCaml interface to Robot OS, opening up the world of robotics to the latest advancements in automated reasoning.* 

In this repository you can find the OCaml bindings to the ROS messaging layer, a collection of ROS node models and examples of formal verification of properites of these models.  

# Running the code 

![](docs/images/Imandra_Demo.gif "Imandra ROS")


To run the code you'll need:
 - an OCaml compiler installed, the current code was tested with the compiler version `4.03.0`
 - the `opam` OCaml package manager
 - ROS "melodic" distribution with rospy python client API and Gazebo simulator  

As usual with the ROS projects, we'll need to run several processes in their individual terminals. 

In the first terminal, we enter the OCaml code folder, install the necessary opam packages and run our ROS node:

    cd imandra_model
    make dev-setup
    make run-node

In the second terminal we build the catkin workspace and run the Gazebo simulator with our bot model loaded:

    cd imandrabot_ws
    catkin_make
    source devel/setup.bash
    roslaunch imandrabot_gazebo imandrabot_world.launch

Finally, in the last terminal we run the python script that serves a as "buffer" between the two processes above:

    cd imandrabot_ws
    python src/zmq_wrapper/src/ros_zmq_translate.py

# Formal verification
