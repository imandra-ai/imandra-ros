open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Control_msgs;;

let json_to_singleJointPositionFeedback_opt json = 
    jreq json "singleJointPositionFeedback_position" json_to_float64_opt @@ fun singleJointPositionFeedback_position ->
    jreq json "singleJointPositionFeedback_velocity" json_to_float64_opt @@ fun singleJointPositionFeedback_velocity ->
    jreq json "singleJointPositionFeedback_error" json_to_float64_opt @@ fun singleJointPositionFeedback_error ->
    Some {
    singleJointPositionFeedback_position;
    singleJointPositionFeedback_velocity;
    singleJointPositionFeedback_error;
    }

let json_to_pidState_opt json = 
    jreq json "pidState_timestep" json_to_duration_opt @@ fun pidState_timestep ->
    jreq json "pidState_error" json_to_float64_opt @@ fun pidState_error ->
    jreq json "pidState_error_dot" json_to_float64_opt @@ fun pidState_error_dot ->
    jreq json "pidState_p_error" json_to_float64_opt @@ fun pidState_p_error ->
    jreq json "pidState_i_error" json_to_float64_opt @@ fun pidState_i_error ->
    jreq json "pidState_d_error" json_to_float64_opt @@ fun pidState_d_error ->
    jreq json "pidState_p_term" json_to_float64_opt @@ fun pidState_p_term ->
    jreq json "pidState_i_term" json_to_float64_opt @@ fun pidState_i_term ->
    jreq json "pidState_d_term" json_to_float64_opt @@ fun pidState_d_term ->
    jreq json "pidState_i_max" json_to_float64_opt @@ fun pidState_i_max ->
    jreq json "pidState_i_min" json_to_float64_opt @@ fun pidState_i_min ->
    jreq json "pidState_output" json_to_float64_opt @@ fun pidState_output ->
    Some {
    pidState_timestep;
    pidState_error;
    pidState_error_dot;
    pidState_p_error;
    pidState_i_error;
    pidState_d_error;
    pidState_p_term;
    pidState_i_term;
    pidState_d_term;
    pidState_i_max;
    pidState_i_min;
    pidState_output;
    }

let json_to_singleJointPositionActionFeedback_opt json = 
    jreq json "singleJointPositionActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun singleJointPositionActionFeedback_status ->
    jreq json "singleJointPositionActionFeedback_feedback" json_to_singleJointPositionFeedback_opt @@ fun singleJointPositionActionFeedback_feedback ->
    Some {
    singleJointPositionActionFeedback_status;
    singleJointPositionActionFeedback_feedback;
    }

let json_to_jointTrajectoryControllerState_opt json = 
    jreq json "jointTrajectoryControllerState_joint_names" (jlist json_to_string_opt) @@ fun jointTrajectoryControllerState_joint_names ->
    jreq json "jointTrajectoryControllerState_desired" Trajectory_msgs_of_json.json_to_jointTrajectoryPoint_opt @@ fun jointTrajectoryControllerState_desired ->
    jreq json "jointTrajectoryControllerState_actual" Trajectory_msgs_of_json.json_to_jointTrajectoryPoint_opt @@ fun jointTrajectoryControllerState_actual ->
    jreq json "jointTrajectoryControllerState_error" Trajectory_msgs_of_json.json_to_jointTrajectoryPoint_opt @@ fun jointTrajectoryControllerState_error ->
    Some {
    jointTrajectoryControllerState_joint_names;
    jointTrajectoryControllerState_desired;
    jointTrajectoryControllerState_actual;
    jointTrajectoryControllerState_error;
    }

let json_to_gripperCommand_opt json = 
    jreq json "gripperCommand_position" json_to_float64_opt @@ fun gripperCommand_position ->
    jreq json "gripperCommand_max_effort" json_to_float64_opt @@ fun gripperCommand_max_effort ->
    Some {
    gripperCommand_position;
    gripperCommand_max_effort;
    }

let json_to_jointTrajectoryGoal_opt json = 
    jreq json "jointTrajectoryGoal_trajectory" Trajectory_msgs_of_json.json_to_jointTrajectory_opt @@ fun jointTrajectoryGoal_trajectory ->
    Some {
    jointTrajectoryGoal_trajectory;
    }

let json_to_singleJointPositionGoal_opt json = 
    jreq json "singleJointPositionGoal_position" json_to_float64_opt @@ fun singleJointPositionGoal_position ->
    jreq json "singleJointPositionGoal_min_duration" json_to_duration_opt @@ fun singleJointPositionGoal_min_duration ->
    jreq json "singleJointPositionGoal_max_velocity" json_to_float64_opt @@ fun singleJointPositionGoal_max_velocity ->
    Some {
    singleJointPositionGoal_position;
    singleJointPositionGoal_min_duration;
    singleJointPositionGoal_max_velocity;
    }

let json_to_pointHeadFeedback_opt json = 
    jreq json "pointing_angle_error" json_to_float64_opt @@ fun pointing_angle_error ->
    Some {
    pointing_angle_error;
    }

let json_to_pointHeadGoal_opt json = 
    jreq json "pointHeadGoal_target" Geometry_msgs_of_json.json_to_pointStamped_opt @@ fun pointHeadGoal_target ->
    jreq json "pointHeadGoal_pointing_axis" Geometry_msgs_of_json.json_to_vector3_opt @@ fun pointHeadGoal_pointing_axis ->
    jreq json "pointHeadGoal_pointing_frame" json_to_string_opt @@ fun pointHeadGoal_pointing_frame ->
    jreq json "pointHeadGoal_min_duration" json_to_duration_opt @@ fun pointHeadGoal_min_duration ->
    jreq json "pointHeadGoal_max_velocity" json_to_float64_opt @@ fun pointHeadGoal_max_velocity ->
    Some {
    pointHeadGoal_target;
    pointHeadGoal_pointing_axis;
    pointHeadGoal_pointing_frame;
    pointHeadGoal_min_duration;
    pointHeadGoal_max_velocity;
    }

let json_to_jointTolerance_opt json = 
    jreq json "jointTolerance_name" json_to_string_opt @@ fun jointTolerance_name ->
    jreq json "jointTolerance_position" json_to_float64_opt @@ fun jointTolerance_position ->
    jreq json "jointTolerance_velocity" json_to_float64_opt @@ fun jointTolerance_velocity ->
    jreq json "jointTolerance_acceleration" json_to_float64_opt @@ fun jointTolerance_acceleration ->
    Some {
    jointTolerance_name;
    jointTolerance_position;
    jointTolerance_velocity;
    jointTolerance_acceleration;
    }

let json_to_followJointTrajectoryResult_opt json = 
    jreq json "error_code" json_to_int32_opt @@ fun error_code ->
    jreq json "error_string" json_to_string_opt @@ fun error_string ->
    Some {
    error_code;
    error_string;
    }

let json_to_gripperCommandResult_opt json = 
    jreq json "gripperCommandResult_position" json_to_float64_opt @@ fun gripperCommandResult_position ->
    jreq json "gripperCommandResult_effort" json_to_float64_opt @@ fun gripperCommandResult_effort ->
    jreq json "gripperCommandResult_stalled" json_to_bool_opt @@ fun gripperCommandResult_stalled ->
    jreq json "gripperCommandResult_reached_goal" json_to_bool_opt @@ fun gripperCommandResult_reached_goal ->
    Some {
    gripperCommandResult_position;
    gripperCommandResult_effort;
    gripperCommandResult_stalled;
    gripperCommandResult_reached_goal;
    }

let json_to_singleJointPositionResult_opt json : singleJointPositionResult option = Some ()

let json_to_jointControllerState_opt json = 
    jreq json "jointControllerState_set_point" json_to_float64_opt @@ fun jointControllerState_set_point ->
    jreq json "jointControllerState_process_value" json_to_float64_opt @@ fun jointControllerState_process_value ->
    jreq json "jointControllerState_process_value_dot" json_to_float64_opt @@ fun jointControllerState_process_value_dot ->
    jreq json "jointControllerState_error" json_to_float64_opt @@ fun jointControllerState_error ->
    jreq json "jointControllerState_time_step" json_to_float64_opt @@ fun jointControllerState_time_step ->
    jreq json "jointControllerState_command" json_to_float64_opt @@ fun jointControllerState_command ->
    jreq json "jointControllerState_p" json_to_float64_opt @@ fun jointControllerState_p ->
    jreq json "jointControllerState_i" json_to_float64_opt @@ fun jointControllerState_i ->
    jreq json "jointControllerState_d" json_to_float64_opt @@ fun jointControllerState_d ->
    jreq json "jointControllerState_i_clamp" json_to_float64_opt @@ fun jointControllerState_i_clamp ->
    jreq json "jointControllerState_antiwindup" json_to_bool_opt @@ fun jointControllerState_antiwindup ->
    Some {
    jointControllerState_set_point;
    jointControllerState_process_value;
    jointControllerState_process_value_dot;
    jointControllerState_error;
    jointControllerState_time_step;
    jointControllerState_command;
    jointControllerState_p;
    jointControllerState_i;
    jointControllerState_d;
    jointControllerState_i_clamp;
    jointControllerState_antiwindup;
    }

let json_to_singleJointPositionActionResult_opt json = 
    jreq json "singleJointPositionActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun singleJointPositionActionResult_status ->
    jreq json "singleJointPositionActionResult_result" json_to_singleJointPositionResult_opt @@ fun singleJointPositionActionResult_result ->
    Some {
    singleJointPositionActionResult_status;
    singleJointPositionActionResult_result;
    }

let json_to_pointHeadResult_opt json : pointHeadResult option = Some ()

let json_to_followJointTrajectoryFeedback_opt json = 
    jreq json "followJointTrajectoryFeedback_joint_names" (jlist json_to_string_opt) @@ fun followJointTrajectoryFeedback_joint_names ->
    jreq json "followJointTrajectoryFeedback_desired" Trajectory_msgs_of_json.json_to_jointTrajectoryPoint_opt @@ fun followJointTrajectoryFeedback_desired ->
    jreq json "followJointTrajectoryFeedback_actual" Trajectory_msgs_of_json.json_to_jointTrajectoryPoint_opt @@ fun followJointTrajectoryFeedback_actual ->
    jreq json "followJointTrajectoryFeedback_error" Trajectory_msgs_of_json.json_to_jointTrajectoryPoint_opt @@ fun followJointTrajectoryFeedback_error ->
    Some {
    followJointTrajectoryFeedback_joint_names;
    followJointTrajectoryFeedback_desired;
    followJointTrajectoryFeedback_actual;
    followJointTrajectoryFeedback_error;
    }

let json_to_gripperCommandFeedback_opt json = 
    jreq json "gripperCommandFeedback_position" json_to_float64_opt @@ fun gripperCommandFeedback_position ->
    jreq json "gripperCommandFeedback_effort" json_to_float64_opt @@ fun gripperCommandFeedback_effort ->
    jreq json "gripperCommandFeedback_stalled" json_to_bool_opt @@ fun gripperCommandFeedback_stalled ->
    jreq json "gripperCommandFeedback_reached_goal" json_to_bool_opt @@ fun gripperCommandFeedback_reached_goal ->
    Some {
    gripperCommandFeedback_position;
    gripperCommandFeedback_effort;
    gripperCommandFeedback_stalled;
    gripperCommandFeedback_reached_goal;
    }

let json_to_jointTrajectoryFeedback_opt json : jointTrajectoryFeedback option = Some ()

let json_to_jointTrajectoryActionGoal_opt json = 
    jreq json "jointTrajectoryActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun jointTrajectoryActionGoal_goal_id ->
    jreq json "jointTrajectoryActionGoal_goal" json_to_jointTrajectoryGoal_opt @@ fun jointTrajectoryActionGoal_goal ->
    Some {
    jointTrajectoryActionGoal_goal_id;
    jointTrajectoryActionGoal_goal;
    }

let json_to_singleJointPositionActionGoal_opt json = 
    jreq json "singleJointPositionActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun singleJointPositionActionGoal_goal_id ->
    jreq json "singleJointPositionActionGoal_goal" json_to_singleJointPositionGoal_opt @@ fun singleJointPositionActionGoal_goal ->
    Some {
    singleJointPositionActionGoal_goal_id;
    singleJointPositionActionGoal_goal;
    }

let json_to_followJointTrajectoryActionResult_opt json = 
    jreq json "followJointTrajectoryActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun followJointTrajectoryActionResult_status ->
    jreq json "followJointTrajectoryActionResult_result" json_to_followJointTrajectoryResult_opt @@ fun followJointTrajectoryActionResult_result ->
    Some {
    followJointTrajectoryActionResult_status;
    followJointTrajectoryActionResult_result;
    }

let json_to_jointTrajectoryResult_opt json : jointTrajectoryResult option = Some ()

let json_to_followJointTrajectoryGoal_opt json = 
    jreq json "followJointTrajectoryGoal_trajectory" Trajectory_msgs_of_json.json_to_jointTrajectory_opt @@ fun followJointTrajectoryGoal_trajectory ->
    jreq json "followJointTrajectoryGoal_path_tolerance" (jlist json_to_jointTolerance_opt) @@ fun followJointTrajectoryGoal_path_tolerance ->
    jreq json "followJointTrajectoryGoal_goal_tolerance" (jlist json_to_jointTolerance_opt) @@ fun followJointTrajectoryGoal_goal_tolerance ->
    jreq json "followJointTrajectoryGoal_goal_time_tolerance" json_to_duration_opt @@ fun followJointTrajectoryGoal_goal_time_tolerance ->
    Some {
    followJointTrajectoryGoal_trajectory;
    followJointTrajectoryGoal_path_tolerance;
    followJointTrajectoryGoal_goal_tolerance;
    followJointTrajectoryGoal_goal_time_tolerance;
    }

let json_to_gripperCommandGoal_opt json = 
    jreq json "gripperCommandGoal_command" json_to_gripperCommand_opt @@ fun gripperCommandGoal_command ->
    Some {
    gripperCommandGoal_command;
    }

let json_to_pointHeadActionGoal_opt json = 
    jreq json "pointHeadActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun pointHeadActionGoal_goal_id ->
    jreq json "pointHeadActionGoal_goal" json_to_pointHeadGoal_opt @@ fun pointHeadActionGoal_goal ->
    Some {
    pointHeadActionGoal_goal_id;
    pointHeadActionGoal_goal;
    }

let json_to_followJointTrajectoryActionGoal_opt json = 
    jreq json "followJointTrajectoryActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun followJointTrajectoryActionGoal_goal_id ->
    jreq json "followJointTrajectoryActionGoal_goal" json_to_followJointTrajectoryGoal_opt @@ fun followJointTrajectoryActionGoal_goal ->
    Some {
    followJointTrajectoryActionGoal_goal_id;
    followJointTrajectoryActionGoal_goal;
    }

let json_to_pointHeadActionFeedback_opt json = 
    jreq json "pointHeadActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun pointHeadActionFeedback_status ->
    jreq json "pointHeadActionFeedback_feedback" json_to_pointHeadFeedback_opt @@ fun pointHeadActionFeedback_feedback ->
    Some {
    pointHeadActionFeedback_status;
    pointHeadActionFeedback_feedback;
    }

let json_to_pointHeadActionResult_opt json = 
    jreq json "pointHeadActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun pointHeadActionResult_status ->
    jreq json "pointHeadActionResult_result" json_to_pointHeadResult_opt @@ fun pointHeadActionResult_result ->
    Some {
    pointHeadActionResult_status;
    pointHeadActionResult_result;
    }

let json_to_gripperCommandActionFeedback_opt json = 
    jreq json "gripperCommandActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun gripperCommandActionFeedback_status ->
    jreq json "gripperCommandActionFeedback_feedback" json_to_gripperCommandFeedback_opt @@ fun gripperCommandActionFeedback_feedback ->
    Some {
    gripperCommandActionFeedback_status;
    gripperCommandActionFeedback_feedback;
    }

let json_to_gripperCommandActionGoal_opt json = 
    jreq json "gripperCommandActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun gripperCommandActionGoal_goal_id ->
    jreq json "gripperCommandActionGoal_goal" json_to_gripperCommandGoal_opt @@ fun gripperCommandActionGoal_goal ->
    Some {
    gripperCommandActionGoal_goal_id;
    gripperCommandActionGoal_goal;
    }

let json_to_jointTrajectoryActionFeedback_opt json = 
    jreq json "jointTrajectoryActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun jointTrajectoryActionFeedback_status ->
    jreq json "jointTrajectoryActionFeedback_feedback" json_to_jointTrajectoryFeedback_opt @@ fun jointTrajectoryActionFeedback_feedback ->
    Some {
    jointTrajectoryActionFeedback_status;
    jointTrajectoryActionFeedback_feedback;
    }

let json_to_followJointTrajectoryActionFeedback_opt json = 
    jreq json "followJointTrajectoryActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun followJointTrajectoryActionFeedback_status ->
    jreq json "followJointTrajectoryActionFeedback_feedback" json_to_followJointTrajectoryFeedback_opt @@ fun followJointTrajectoryActionFeedback_feedback ->
    Some {
    followJointTrajectoryActionFeedback_status;
    followJointTrajectoryActionFeedback_feedback;
    }

let json_to_gripperCommandActionResult_opt json = 
    jreq json "gripperCommandActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun gripperCommandActionResult_status ->
    jreq json "gripperCommandActionResult_result" json_to_gripperCommandResult_opt @@ fun gripperCommandActionResult_result ->
    Some {
    gripperCommandActionResult_status;
    gripperCommandActionResult_result;
    }

let json_to_singleJointPositionAction_opt json = 
    jreq json "singleJointPositionAction_action_goal" json_to_singleJointPositionActionGoal_opt @@ fun singleJointPositionAction_action_goal ->
    jreq json "singleJointPositionAction_action_result" json_to_singleJointPositionActionResult_opt @@ fun singleJointPositionAction_action_result ->
    jreq json "singleJointPositionAction_action_feedback" json_to_singleJointPositionActionFeedback_opt @@ fun singleJointPositionAction_action_feedback ->
    Some {
    singleJointPositionAction_action_goal;
    singleJointPositionAction_action_result;
    singleJointPositionAction_action_feedback;
    }

let json_to_jointTrajectoryActionResult_opt json = 
    jreq json "jointTrajectoryActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun jointTrajectoryActionResult_status ->
    jreq json "jointTrajectoryActionResult_result" json_to_jointTrajectoryResult_opt @@ fun jointTrajectoryActionResult_result ->
    Some {
    jointTrajectoryActionResult_status;
    jointTrajectoryActionResult_result;
    }

let json_to_pointHeadAction_opt json = 
    jreq json "pointHeadAction_action_goal" json_to_pointHeadActionGoal_opt @@ fun pointHeadAction_action_goal ->
    jreq json "pointHeadAction_action_result" json_to_pointHeadActionResult_opt @@ fun pointHeadAction_action_result ->
    jreq json "pointHeadAction_action_feedback" json_to_pointHeadActionFeedback_opt @@ fun pointHeadAction_action_feedback ->
    Some {
    pointHeadAction_action_goal;
    pointHeadAction_action_result;
    pointHeadAction_action_feedback;
    }

let json_to_gripperCommandAction_opt json = 
    jreq json "gripperCommandAction_action_goal" json_to_gripperCommandActionGoal_opt @@ fun gripperCommandAction_action_goal ->
    jreq json "gripperCommandAction_action_result" json_to_gripperCommandActionResult_opt @@ fun gripperCommandAction_action_result ->
    jreq json "gripperCommandAction_action_feedback" json_to_gripperCommandActionFeedback_opt @@ fun gripperCommandAction_action_feedback ->
    Some {
    gripperCommandAction_action_goal;
    gripperCommandAction_action_result;
    gripperCommandAction_action_feedback;
    }

let json_to_followJointTrajectoryAction_opt json = 
    jreq json "followJointTrajectoryAction_action_goal" json_to_followJointTrajectoryActionGoal_opt @@ fun followJointTrajectoryAction_action_goal ->
    jreq json "followJointTrajectoryAction_action_result" json_to_followJointTrajectoryActionResult_opt @@ fun followJointTrajectoryAction_action_result ->
    jreq json "followJointTrajectoryAction_action_feedback" json_to_followJointTrajectoryActionFeedback_opt @@ fun followJointTrajectoryAction_action_feedback ->
    Some {
    followJointTrajectoryAction_action_goal;
    followJointTrajectoryAction_action_result;
    followJointTrajectoryAction_action_feedback;
    }

let json_to_jointTrajectoryAction_opt json = 
    jreq json "jointTrajectoryAction_action_goal" json_to_jointTrajectoryActionGoal_opt @@ fun jointTrajectoryAction_action_goal ->
    jreq json "jointTrajectoryAction_action_result" json_to_jointTrajectoryActionResult_opt @@ fun jointTrajectoryAction_action_result ->
    jreq json "jointTrajectoryAction_action_feedback" json_to_jointTrajectoryActionFeedback_opt @@ fun jointTrajectoryAction_action_feedback ->
    Some {
    jointTrajectoryAction_action_goal;
    jointTrajectoryAction_action_result;
    jointTrajectoryAction_action_feedback;
    }

