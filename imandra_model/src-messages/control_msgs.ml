open Basic_types;;

type singleJointPositionFeedback = {
   singleJointPositionFeedback_position : float64 ;
   singleJointPositionFeedback_velocity : float64 ;
   singleJointPositionFeedback_error : float64 ;
}

type pidState = {
   pidState_timestep : duration ;
   pidState_error : float64 ;
   pidState_error_dot : float64 ;
   pidState_p_error : float64 ;
   pidState_i_error : float64 ;
   pidState_d_error : float64 ;
   pidState_p_term : float64 ;
   pidState_i_term : float64 ;
   pidState_d_term : float64 ;
   pidState_i_max : float64 ;
   pidState_i_min : float64 ;
   pidState_output : float64 ;
}

type singleJointPositionActionFeedback = {
   singleJointPositionActionFeedback_status : Actionlib_msgs.goalStatus ;
   singleJointPositionActionFeedback_feedback : singleJointPositionFeedback ;
}

type jointTrajectoryControllerState = {
   jointTrajectoryControllerState_joint_names : string list ;
   jointTrajectoryControllerState_desired : Trajectory_msgs.jointTrajectoryPoint ;
   jointTrajectoryControllerState_actual : Trajectory_msgs.jointTrajectoryPoint ;
   jointTrajectoryControllerState_error : Trajectory_msgs.jointTrajectoryPoint ;
}

type gripperCommand = {
   gripperCommand_position : float64 ;
   gripperCommand_max_effort : float64 ;
}

type jointTrajectoryGoal = {
   jointTrajectoryGoal_trajectory : Trajectory_msgs.jointTrajectory ;
}

type singleJointPositionGoal = {
   singleJointPositionGoal_position : float64 ;
   singleJointPositionGoal_min_duration : duration ;
   singleJointPositionGoal_max_velocity : float64 ;
}

type pointHeadFeedback = {
   pointing_angle_error : float64 ;
}

type pointHeadGoal = {
   pointHeadGoal_target : Geometry_msgs.pointStamped ;
   pointHeadGoal_pointing_axis : Geometry_msgs.vector3 ;
   pointHeadGoal_pointing_frame : string ;
   pointHeadGoal_min_duration : duration ;
   pointHeadGoal_max_velocity : float64 ;
}

type jointTolerance = {
   jointTolerance_name : string ;
   jointTolerance_position : float64 ;
   jointTolerance_velocity : float64 ;
   jointTolerance_acceleration : float64 ;
}

type followJointTrajectoryResult = {
   error_code : int32 ;
   error_string : string ;
}

type gripperCommandResult = {
   gripperCommandResult_position : float64 ;
   gripperCommandResult_effort : float64 ;
   gripperCommandResult_stalled : bool ;
   gripperCommandResult_reached_goal : bool ;
}

type singleJointPositionResult = ()

type jointControllerState = {
   jointControllerState_set_point : float64 ;
   jointControllerState_process_value : float64 ;
   jointControllerState_process_value_dot : float64 ;
   jointControllerState_error : float64 ;
   jointControllerState_time_step : float64 ;
   jointControllerState_command : float64 ;
   jointControllerState_p : float64 ;
   jointControllerState_i : float64 ;
   jointControllerState_d : float64 ;
   jointControllerState_i_clamp : float64 ;
   jointControllerState_antiwindup : bool ;
}

type singleJointPositionActionResult = {
   singleJointPositionActionResult_status : Actionlib_msgs.goalStatus ;
   singleJointPositionActionResult_result : singleJointPositionResult ;
}

type pointHeadResult = ()

type followJointTrajectoryFeedback = {
   followJointTrajectoryFeedback_joint_names : string list ;
   followJointTrajectoryFeedback_desired : Trajectory_msgs.jointTrajectoryPoint ;
   followJointTrajectoryFeedback_actual : Trajectory_msgs.jointTrajectoryPoint ;
   followJointTrajectoryFeedback_error : Trajectory_msgs.jointTrajectoryPoint ;
}

type gripperCommandFeedback = {
   gripperCommandFeedback_position : float64 ;
   gripperCommandFeedback_effort : float64 ;
   gripperCommandFeedback_stalled : bool ;
   gripperCommandFeedback_reached_goal : bool ;
}

type jointTrajectoryFeedback = ()

type jointTrajectoryActionGoal = {
   jointTrajectoryActionGoal_goal_id : Actionlib_msgs.goalID ;
   jointTrajectoryActionGoal_goal : jointTrajectoryGoal ;
}

type singleJointPositionActionGoal = {
   singleJointPositionActionGoal_goal_id : Actionlib_msgs.goalID ;
   singleJointPositionActionGoal_goal : singleJointPositionGoal ;
}

type followJointTrajectoryActionResult = {
   followJointTrajectoryActionResult_status : Actionlib_msgs.goalStatus ;
   followJointTrajectoryActionResult_result : followJointTrajectoryResult ;
}

type jointTrajectoryResult = ()

type followJointTrajectoryGoal = {
   followJointTrajectoryGoal_trajectory : Trajectory_msgs.jointTrajectory ;
   followJointTrajectoryGoal_path_tolerance : jointTolerance list ;
   followJointTrajectoryGoal_goal_tolerance : jointTolerance list ;
   followJointTrajectoryGoal_goal_time_tolerance : duration ;
}

type gripperCommandGoal = {
   gripperCommandGoal_command : gripperCommand ;
}

type pointHeadActionGoal = {
   pointHeadActionGoal_goal_id : Actionlib_msgs.goalID ;
   pointHeadActionGoal_goal : pointHeadGoal ;
}

type followJointTrajectoryActionGoal = {
   followJointTrajectoryActionGoal_goal_id : Actionlib_msgs.goalID ;
   followJointTrajectoryActionGoal_goal : followJointTrajectoryGoal ;
}

type pointHeadActionFeedback = {
   pointHeadActionFeedback_status : Actionlib_msgs.goalStatus ;
   pointHeadActionFeedback_feedback : pointHeadFeedback ;
}

type pointHeadActionResult = {
   pointHeadActionResult_status : Actionlib_msgs.goalStatus ;
   pointHeadActionResult_result : pointHeadResult ;
}

type gripperCommandActionFeedback = {
   gripperCommandActionFeedback_status : Actionlib_msgs.goalStatus ;
   gripperCommandActionFeedback_feedback : gripperCommandFeedback ;
}

type gripperCommandActionGoal = {
   gripperCommandActionGoal_goal_id : Actionlib_msgs.goalID ;
   gripperCommandActionGoal_goal : gripperCommandGoal ;
}

type jointTrajectoryActionFeedback = {
   jointTrajectoryActionFeedback_status : Actionlib_msgs.goalStatus ;
   jointTrajectoryActionFeedback_feedback : jointTrajectoryFeedback ;
}

type followJointTrajectoryActionFeedback = {
   followJointTrajectoryActionFeedback_status : Actionlib_msgs.goalStatus ;
   followJointTrajectoryActionFeedback_feedback : followJointTrajectoryFeedback ;
}

type gripperCommandActionResult = {
   gripperCommandActionResult_status : Actionlib_msgs.goalStatus ;
   gripperCommandActionResult_result : gripperCommandResult ;
}

type singleJointPositionAction = {
   singleJointPositionAction_action_goal : singleJointPositionActionGoal ;
   singleJointPositionAction_action_result : singleJointPositionActionResult ;
   singleJointPositionAction_action_feedback : singleJointPositionActionFeedback ;
}

type jointTrajectoryActionResult = {
   jointTrajectoryActionResult_status : Actionlib_msgs.goalStatus ;
   jointTrajectoryActionResult_result : jointTrajectoryResult ;
}

type pointHeadAction = {
   pointHeadAction_action_goal : pointHeadActionGoal ;
   pointHeadAction_action_result : pointHeadActionResult ;
   pointHeadAction_action_feedback : pointHeadActionFeedback ;
}

type gripperCommandAction = {
   gripperCommandAction_action_goal : gripperCommandActionGoal ;
   gripperCommandAction_action_result : gripperCommandActionResult ;
   gripperCommandAction_action_feedback : gripperCommandActionFeedback ;
}

type followJointTrajectoryAction = {
   followJointTrajectoryAction_action_goal : followJointTrajectoryActionGoal ;
   followJointTrajectoryAction_action_result : followJointTrajectoryActionResult ;
   followJointTrajectoryAction_action_feedback : followJointTrajectoryActionFeedback ;
}

type jointTrajectoryAction = {
   jointTrajectoryAction_action_goal : jointTrajectoryActionGoal ;
   jointTrajectoryAction_action_result : jointTrajectoryActionResult ;
   jointTrajectoryAction_action_feedback : jointTrajectoryActionFeedback ;
}

