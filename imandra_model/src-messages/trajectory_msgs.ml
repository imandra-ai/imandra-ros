open Basic_types;;

type multiDOFJointTrajectoryPoint = {
   transforms : Geometry_msgs.transform list ;
   velocities : Geometry_msgs.twist list ;
   accelerations : Geometry_msgs.twist list ;
   time_from_start : duration ;
}

type multiDOFJointTrajectory = {
   joint_names : string list ;
   points : multiDOFJointTrajectoryPoint list ;
}

type jointTrajectoryPoint = {
   positions : float64 list ;
   velocities : float64 list ;
   accelerations : float64 list ;
   effort : float64 list ;
   time_from_start : duration ;
}

type jointTrajectory = {
   joint_names : string list ;
   points : jointTrajectoryPoint list ;
}

