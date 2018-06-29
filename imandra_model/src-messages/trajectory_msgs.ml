open Basic_types;;

type multiDOFJointTrajectoryPoint = {
   multiDOFJointTrajectoryPoint_transforms : Geometry_msgs.transform list ;
   multiDOFJointTrajectoryPoint_velocities : Geometry_msgs.twist list ;
   multiDOFJointTrajectoryPoint_accelerations : Geometry_msgs.twist list ;
   multiDOFJointTrajectoryPoint_time_from_start : duration ;
}

type multiDOFJointTrajectory = {
   multiDOFJointTrajectory_joint_names : string list ;
   multiDOFJointTrajectory_points : multiDOFJointTrajectoryPoint list ;
}

type jointTrajectoryPoint = {
   jointTrajectoryPoint_positions : float64 list ;
   jointTrajectoryPoint_velocities : float64 list ;
   jointTrajectoryPoint_accelerations : float64 list ;
   jointTrajectoryPoint_effort : float64 list ;
   jointTrajectoryPoint_time_from_start : duration ;
}

type jointTrajectory = {
   jointTrajectory_joint_names : string list ;
   jointTrajectory_points : jointTrajectoryPoint list ;
}

