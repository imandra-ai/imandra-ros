open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Control_msgs;;

let singleJointPositionFeedback_to_json x = [
    ( "singleJointPositionFeedback_position" , x.singleJointPositionFeedback_position |> float64_to_json );
    ( "singleJointPositionFeedback_velocity" , x.singleJointPositionFeedback_velocity |> float64_to_json );
    ( "singleJointPositionFeedback_error" , x.singleJointPositionFeedback_error |> float64_to_json );
    ] |> assoc_filter_nulls

let pidState_to_json x = [
    ( "pidState_timestep" , x.pidState_timestep |> duration_to_json );
    ( "pidState_error" , x.pidState_error |> float64_to_json );
    ( "pidState_error_dot" , x.pidState_error_dot |> float64_to_json );
    ( "pidState_p_error" , x.pidState_p_error |> float64_to_json );
    ( "pidState_i_error" , x.pidState_i_error |> float64_to_json );
    ( "pidState_d_error" , x.pidState_d_error |> float64_to_json );
    ( "pidState_p_term" , x.pidState_p_term |> float64_to_json );
    ( "pidState_i_term" , x.pidState_i_term |> float64_to_json );
    ( "pidState_d_term" , x.pidState_d_term |> float64_to_json );
    ( "pidState_i_max" , x.pidState_i_max |> float64_to_json );
    ( "pidState_i_min" , x.pidState_i_min |> float64_to_json );
    ( "pidState_output" , x.pidState_output |> float64_to_json );
    ] |> assoc_filter_nulls

let singleJointPositionActionFeedback_to_json x = [
    ( "singleJointPositionActionFeedback_status" , x.singleJointPositionActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "singleJointPositionActionFeedback_feedback" , x.singleJointPositionActionFeedback_feedback |> singleJointPositionFeedback_to_json );
    ] |> assoc_filter_nulls

let jointTrajectoryControllerState_to_json x = [
    ( "jointTrajectoryControllerState_joint_names" , x.jointTrajectoryControllerState_joint_names |> (mklist string_to_json) );
    ( "jointTrajectoryControllerState_desired" , x.jointTrajectoryControllerState_desired |> Trajectory_msgs_to_json.jointTrajectoryPoint_to_json );
    ( "jointTrajectoryControllerState_actual" , x.jointTrajectoryControllerState_actual |> Trajectory_msgs_to_json.jointTrajectoryPoint_to_json );
    ( "jointTrajectoryControllerState_error" , x.jointTrajectoryControllerState_error |> Trajectory_msgs_to_json.jointTrajectoryPoint_to_json );
    ] |> assoc_filter_nulls

let gripperCommand_to_json x = [
    ( "gripperCommand_position" , x.gripperCommand_position |> float64_to_json );
    ( "gripperCommand_max_effort" , x.gripperCommand_max_effort |> float64_to_json );
    ] |> assoc_filter_nulls

let jointTrajectoryGoal_to_json x = [
    ( "jointTrajectoryGoal_trajectory" , x.jointTrajectoryGoal_trajectory |> Trajectory_msgs_to_json.jointTrajectory_to_json );
    ] |> assoc_filter_nulls

let singleJointPositionGoal_to_json x = [
    ( "singleJointPositionGoal_position" , x.singleJointPositionGoal_position |> float64_to_json );
    ( "singleJointPositionGoal_min_duration" , x.singleJointPositionGoal_min_duration |> duration_to_json );
    ( "singleJointPositionGoal_max_velocity" , x.singleJointPositionGoal_max_velocity |> float64_to_json );
    ] |> assoc_filter_nulls

let pointHeadFeedback_to_json x = [
    ( "pointing_angle_error" , x.pointing_angle_error |> float64_to_json );
    ] |> assoc_filter_nulls

let pointHeadGoal_to_json x = [
    ( "pointHeadGoal_target" , x.pointHeadGoal_target |> Geometry_msgs_to_json.pointStamped_to_json );
    ( "pointHeadGoal_pointing_axis" , x.pointHeadGoal_pointing_axis |> Geometry_msgs_to_json.vector3_to_json );
    ( "pointHeadGoal_pointing_frame" , x.pointHeadGoal_pointing_frame |> string_to_json );
    ( "pointHeadGoal_min_duration" , x.pointHeadGoal_min_duration |> duration_to_json );
    ( "pointHeadGoal_max_velocity" , x.pointHeadGoal_max_velocity |> float64_to_json );
    ] |> assoc_filter_nulls

let jointTolerance_to_json x = [
    ( "jointTolerance_name" , x.jointTolerance_name |> string_to_json );
    ( "jointTolerance_position" , x.jointTolerance_position |> float64_to_json );
    ( "jointTolerance_velocity" , x.jointTolerance_velocity |> float64_to_json );
    ( "jointTolerance_acceleration" , x.jointTolerance_acceleration |> float64_to_json );
    ] |> assoc_filter_nulls

let followJointTrajectoryResult_to_json x = [
    ( "error_code" , x.error_code |> int32_to_json );
    ( "error_string" , x.error_string |> string_to_json );
    ] |> assoc_filter_nulls

let gripperCommandResult_to_json x = [
    ( "gripperCommandResult_position" , x.gripperCommandResult_position |> float64_to_json );
    ( "gripperCommandResult_effort" , x.gripperCommandResult_effort |> float64_to_json );
    ( "gripperCommandResult_stalled" , x.gripperCommandResult_stalled |> bool_to_json );
    ( "gripperCommandResult_reached_goal" , x.gripperCommandResult_reached_goal |> bool_to_json );
    ] |> assoc_filter_nulls

let singleJointPositionResult_to_json x = `Assoc []

let jointControllerState_to_json x = [
    ( "jointControllerState_set_point" , x.jointControllerState_set_point |> float64_to_json );
    ( "jointControllerState_process_value" , x.jointControllerState_process_value |> float64_to_json );
    ( "jointControllerState_process_value_dot" , x.jointControllerState_process_value_dot |> float64_to_json );
    ( "jointControllerState_error" , x.jointControllerState_error |> float64_to_json );
    ( "jointControllerState_time_step" , x.jointControllerState_time_step |> float64_to_json );
    ( "jointControllerState_command" , x.jointControllerState_command |> float64_to_json );
    ( "jointControllerState_p" , x.jointControllerState_p |> float64_to_json );
    ( "jointControllerState_i" , x.jointControllerState_i |> float64_to_json );
    ( "jointControllerState_d" , x.jointControllerState_d |> float64_to_json );
    ( "jointControllerState_i_clamp" , x.jointControllerState_i_clamp |> float64_to_json );
    ( "jointControllerState_antiwindup" , x.jointControllerState_antiwindup |> bool_to_json );
    ] |> assoc_filter_nulls

let singleJointPositionActionResult_to_json x = [
    ( "singleJointPositionActionResult_status" , x.singleJointPositionActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "singleJointPositionActionResult_result" , x.singleJointPositionActionResult_result |> singleJointPositionResult_to_json );
    ] |> assoc_filter_nulls

let pointHeadResult_to_json x = `Assoc []

let followJointTrajectoryFeedback_to_json x = [
    ( "followJointTrajectoryFeedback_joint_names" , x.followJointTrajectoryFeedback_joint_names |> (mklist string_to_json) );
    ( "followJointTrajectoryFeedback_desired" , x.followJointTrajectoryFeedback_desired |> Trajectory_msgs_to_json.jointTrajectoryPoint_to_json );
    ( "followJointTrajectoryFeedback_actual" , x.followJointTrajectoryFeedback_actual |> Trajectory_msgs_to_json.jointTrajectoryPoint_to_json );
    ( "followJointTrajectoryFeedback_error" , x.followJointTrajectoryFeedback_error |> Trajectory_msgs_to_json.jointTrajectoryPoint_to_json );
    ] |> assoc_filter_nulls

let gripperCommandFeedback_to_json x = [
    ( "gripperCommandFeedback_position" , x.gripperCommandFeedback_position |> float64_to_json );
    ( "gripperCommandFeedback_effort" , x.gripperCommandFeedback_effort |> float64_to_json );
    ( "gripperCommandFeedback_stalled" , x.gripperCommandFeedback_stalled |> bool_to_json );
    ( "gripperCommandFeedback_reached_goal" , x.gripperCommandFeedback_reached_goal |> bool_to_json );
    ] |> assoc_filter_nulls

let jointTrajectoryFeedback_to_json x = `Assoc []

let jointTrajectoryActionGoal_to_json x = [
    ( "jointTrajectoryActionGoal_goal_id" , x.jointTrajectoryActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "jointTrajectoryActionGoal_goal" , x.jointTrajectoryActionGoal_goal |> jointTrajectoryGoal_to_json );
    ] |> assoc_filter_nulls

let singleJointPositionActionGoal_to_json x = [
    ( "singleJointPositionActionGoal_goal_id" , x.singleJointPositionActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "singleJointPositionActionGoal_goal" , x.singleJointPositionActionGoal_goal |> singleJointPositionGoal_to_json );
    ] |> assoc_filter_nulls

let followJointTrajectoryActionResult_to_json x = [
    ( "followJointTrajectoryActionResult_status" , x.followJointTrajectoryActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "followJointTrajectoryActionResult_result" , x.followJointTrajectoryActionResult_result |> followJointTrajectoryResult_to_json );
    ] |> assoc_filter_nulls

let jointTrajectoryResult_to_json x = `Assoc []

let followJointTrajectoryGoal_to_json x = [
    ( "followJointTrajectoryGoal_trajectory" , x.followJointTrajectoryGoal_trajectory |> Trajectory_msgs_to_json.jointTrajectory_to_json );
    ( "followJointTrajectoryGoal_path_tolerance" , x.followJointTrajectoryGoal_path_tolerance |> (mklist jointTolerance_to_json) );
    ( "followJointTrajectoryGoal_goal_tolerance" , x.followJointTrajectoryGoal_goal_tolerance |> (mklist jointTolerance_to_json) );
    ( "followJointTrajectoryGoal_goal_time_tolerance" , x.followJointTrajectoryGoal_goal_time_tolerance |> duration_to_json );
    ] |> assoc_filter_nulls

let gripperCommandGoal_to_json x = [
    ( "gripperCommandGoal_command" , x.gripperCommandGoal_command |> gripperCommand_to_json );
    ] |> assoc_filter_nulls

let pointHeadActionGoal_to_json x = [
    ( "pointHeadActionGoal_goal_id" , x.pointHeadActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "pointHeadActionGoal_goal" , x.pointHeadActionGoal_goal |> pointHeadGoal_to_json );
    ] |> assoc_filter_nulls

let followJointTrajectoryActionGoal_to_json x = [
    ( "followJointTrajectoryActionGoal_goal_id" , x.followJointTrajectoryActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "followJointTrajectoryActionGoal_goal" , x.followJointTrajectoryActionGoal_goal |> followJointTrajectoryGoal_to_json );
    ] |> assoc_filter_nulls

let pointHeadActionFeedback_to_json x = [
    ( "pointHeadActionFeedback_status" , x.pointHeadActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "pointHeadActionFeedback_feedback" , x.pointHeadActionFeedback_feedback |> pointHeadFeedback_to_json );
    ] |> assoc_filter_nulls

let pointHeadActionResult_to_json x = [
    ( "pointHeadActionResult_status" , x.pointHeadActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "pointHeadActionResult_result" , x.pointHeadActionResult_result |> pointHeadResult_to_json );
    ] |> assoc_filter_nulls

let gripperCommandActionFeedback_to_json x = [
    ( "gripperCommandActionFeedback_status" , x.gripperCommandActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "gripperCommandActionFeedback_feedback" , x.gripperCommandActionFeedback_feedback |> gripperCommandFeedback_to_json );
    ] |> assoc_filter_nulls

let gripperCommandActionGoal_to_json x = [
    ( "gripperCommandActionGoal_goal_id" , x.gripperCommandActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "gripperCommandActionGoal_goal" , x.gripperCommandActionGoal_goal |> gripperCommandGoal_to_json );
    ] |> assoc_filter_nulls

let jointTrajectoryActionFeedback_to_json x = [
    ( "jointTrajectoryActionFeedback_status" , x.jointTrajectoryActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "jointTrajectoryActionFeedback_feedback" , x.jointTrajectoryActionFeedback_feedback |> jointTrajectoryFeedback_to_json );
    ] |> assoc_filter_nulls

let followJointTrajectoryActionFeedback_to_json x = [
    ( "followJointTrajectoryActionFeedback_status" , x.followJointTrajectoryActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "followJointTrajectoryActionFeedback_feedback" , x.followJointTrajectoryActionFeedback_feedback |> followJointTrajectoryFeedback_to_json );
    ] |> assoc_filter_nulls

let gripperCommandActionResult_to_json x = [
    ( "gripperCommandActionResult_status" , x.gripperCommandActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "gripperCommandActionResult_result" , x.gripperCommandActionResult_result |> gripperCommandResult_to_json );
    ] |> assoc_filter_nulls

let singleJointPositionAction_to_json x = [
    ( "singleJointPositionAction_action_goal" , x.singleJointPositionAction_action_goal |> singleJointPositionActionGoal_to_json );
    ( "singleJointPositionAction_action_result" , x.singleJointPositionAction_action_result |> singleJointPositionActionResult_to_json );
    ( "singleJointPositionAction_action_feedback" , x.singleJointPositionAction_action_feedback |> singleJointPositionActionFeedback_to_json );
    ] |> assoc_filter_nulls

let jointTrajectoryActionResult_to_json x = [
    ( "jointTrajectoryActionResult_status" , x.jointTrajectoryActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "jointTrajectoryActionResult_result" , x.jointTrajectoryActionResult_result |> jointTrajectoryResult_to_json );
    ] |> assoc_filter_nulls

let pointHeadAction_to_json x = [
    ( "pointHeadAction_action_goal" , x.pointHeadAction_action_goal |> pointHeadActionGoal_to_json );
    ( "pointHeadAction_action_result" , x.pointHeadAction_action_result |> pointHeadActionResult_to_json );
    ( "pointHeadAction_action_feedback" , x.pointHeadAction_action_feedback |> pointHeadActionFeedback_to_json );
    ] |> assoc_filter_nulls

let gripperCommandAction_to_json x = [
    ( "gripperCommandAction_action_goal" , x.gripperCommandAction_action_goal |> gripperCommandActionGoal_to_json );
    ( "gripperCommandAction_action_result" , x.gripperCommandAction_action_result |> gripperCommandActionResult_to_json );
    ( "gripperCommandAction_action_feedback" , x.gripperCommandAction_action_feedback |> gripperCommandActionFeedback_to_json );
    ] |> assoc_filter_nulls

let followJointTrajectoryAction_to_json x = [
    ( "followJointTrajectoryAction_action_goal" , x.followJointTrajectoryAction_action_goal |> followJointTrajectoryActionGoal_to_json );
    ( "followJointTrajectoryAction_action_result" , x.followJointTrajectoryAction_action_result |> followJointTrajectoryActionResult_to_json );
    ( "followJointTrajectoryAction_action_feedback" , x.followJointTrajectoryAction_action_feedback |> followJointTrajectoryActionFeedback_to_json );
    ] |> assoc_filter_nulls

let jointTrajectoryAction_to_json x = [
    ( "jointTrajectoryAction_action_goal" , x.jointTrajectoryAction_action_goal |> jointTrajectoryActionGoal_to_json );
    ( "jointTrajectoryAction_action_result" , x.jointTrajectoryAction_action_result |> jointTrajectoryActionResult_to_json );
    ( "jointTrajectoryAction_action_feedback" , x.jointTrajectoryAction_action_feedback |> jointTrajectoryActionFeedback_to_json );
    ] |> assoc_filter_nulls

