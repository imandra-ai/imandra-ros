open Basic_types;;

type singleJointPositionFeedback = {
   position : float64 ;
   velocity : float64 ;
   error : float64 ;
}

type pidState = {
   timestep : duration ;
   error : float64 ;
   error_dot : float64 ;
   p_error : float64 ;
   i_error : float64 ;
   d_error : float64 ;
   p_term : float64 ;
   i_term : float64 ;
   d_term : float64 ;
   i_max : float64 ;
   i_min : float64 ;
   output : float64 ;
}

type singleJointPositionActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : singleJointPositionFeedback ;
}

type jointTrajectoryControllerState = {
   joint_names : string list ;
   desired : Trajectory_msgs.jointTrajectoryPoint ;
   actual : Trajectory_msgs.jointTrajectoryPoint ;
   error : Trajectory_msgs.jointTrajectoryPoint ;
}

type gripperCommand = {
   position : float64 ;
   max_effort : float64 ;
}

type jointTrajectoryGoal = {
   trajectory : Trajectory_msgs.jointTrajectory ;
}

type singleJointPositionGoal = {
   position : float64 ;
   min_duration : duration ;
   max_velocity : float64 ;
}

type pointHeadFeedback = {
   pointing_angle_error : float64 ;
}

type pointHeadGoal = {
   target : Geometry_msgs.pointStamped ;
   pointing_axis : Geometry_msgs.vector3 ;
   pointing_frame : string ;
   min_duration : duration ;
   max_velocity : float64 ;
}

type jointTolerance = {
   name : string ;
   position : float64 ;
   velocity : float64 ;
   acceleration : float64 ;
}

type followJointTrajectoryResult = {
   error_code : int32 ;
   error_string : string ;
}

type gripperCommandResult = {
   position : float64 ;
   effort : float64 ;
   stalled : bool ;
   reached_goal : bool ;
}

type singleJointPositionResult = ()

type jointControllerState = {
   set_point : float64 ;
   process_value : float64 ;
   process_value_dot : float64 ;
   error : float64 ;
   time_step : float64 ;
   command : float64 ;
   p : float64 ;
   i : float64 ;
   d : float64 ;
   i_clamp : float64 ;
   antiwindup : bool ;
}

type singleJointPositionActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : singleJointPositionResult ;
}

type pointHeadResult = ()

type followJointTrajectoryFeedback = {
   joint_names : string list ;
   desired : Trajectory_msgs.jointTrajectoryPoint ;
   actual : Trajectory_msgs.jointTrajectoryPoint ;
   error : Trajectory_msgs.jointTrajectoryPoint ;
}

type gripperCommandFeedback = {
   position : float64 ;
   effort : float64 ;
   stalled : bool ;
   reached_goal : bool ;
}

type jointTrajectoryFeedback = ()

type jointTrajectoryActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : jointTrajectoryGoal ;
}

type singleJointPositionActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : singleJointPositionGoal ;
}

type followJointTrajectoryActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : followJointTrajectoryResult ;
}

type jointTrajectoryResult = ()

type followJointTrajectoryGoal = {
   trajectory : Trajectory_msgs.jointTrajectory ;
   path_tolerance : jointTolerance list ;
   goal_tolerance : jointTolerance list ;
   goal_time_tolerance : duration ;
}

type gripperCommandGoal = {
   command : gripperCommand ;
}

type pointHeadActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : pointHeadGoal ;
}

type followJointTrajectoryActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : followJointTrajectoryGoal ;
}

type pointHeadActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : pointHeadFeedback ;
}

type pointHeadActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : pointHeadResult ;
}

type gripperCommandActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : gripperCommandFeedback ;
}

type gripperCommandActionGoal = {
   goal_id : Actionlib_msgs.goalID ;
   goal : gripperCommandGoal ;
}

type jointTrajectoryActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : jointTrajectoryFeedback ;
}

type followJointTrajectoryActionFeedback = {
   status : Actionlib_msgs.goalStatus ;
   feedback : followJointTrajectoryFeedback ;
}

type gripperCommandActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : gripperCommandResult ;
}

type singleJointPositionAction = {
   action_goal : singleJointPositionActionGoal ;
   action_result : singleJointPositionActionResult ;
   action_feedback : singleJointPositionActionFeedback ;
}

type jointTrajectoryActionResult = {
   status : Actionlib_msgs.goalStatus ;
   result : jointTrajectoryResult ;
}

type pointHeadAction = {
   action_goal : pointHeadActionGoal ;
   action_result : pointHeadActionResult ;
   action_feedback : pointHeadActionFeedback ;
}

type gripperCommandAction = {
   action_goal : gripperCommandActionGoal ;
   action_result : gripperCommandActionResult ;
   action_feedback : gripperCommandActionFeedback ;
}

type followJointTrajectoryAction = {
   action_goal : followJointTrajectoryActionGoal ;
   action_result : followJointTrajectoryActionResult ;
   action_feedback : followJointTrajectoryActionFeedback ;
}

type jointTrajectoryAction = {
   action_goal : jointTrajectoryActionGoal ;
   action_result : jointTrajectoryActionResult ;
   action_feedback : jointTrajectoryActionFeedback ;
}

