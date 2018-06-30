open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Tf2_msgs;;

let json_to_lookupTransformFeedback_opt json : lookupTransformFeedback option = Some ()

let json_to_tFMessage_opt json = 
    jreq json "transforms" (jlist Geometry_msgs_of_json.json_to_transformStamped_opt) @@ fun transforms ->
    Some {
    transforms;
    }

let json_to_lookupTransformGoal_opt json = 
    jreq json "target_frame" json_to_string_opt @@ fun target_frame ->
    jreq json "source_frame" json_to_string_opt @@ fun source_frame ->
    jreq json "source_time" json_to_time_opt @@ fun source_time ->
    jreq json "timeout" json_to_duration_opt @@ fun timeout ->
    jreq json "target_time" json_to_time_opt @@ fun target_time ->
    jreq json "fixed_frame" json_to_string_opt @@ fun fixed_frame ->
    jreq json "advanced" json_to_bool_opt @@ fun advanced ->
    Some {
    target_frame;
    source_frame;
    source_time;
    timeout;
    target_time;
    fixed_frame;
    advanced;
    }

let json_to_lookupTransformActionGoal_opt json = 
    jreq json "lookupTransformActionGoal_header" Std_msgs_of_json.json_to_header_opt @@ fun lookupTransformActionGoal_header ->
    jreq json "lookupTransformActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun lookupTransformActionGoal_goal_id ->
    jreq json "lookupTransformActionGoal_goal" json_to_lookupTransformGoal_opt @@ fun lookupTransformActionGoal_goal ->
    Some {
    lookupTransformActionGoal_header;
    lookupTransformActionGoal_goal_id;
    lookupTransformActionGoal_goal;
    }

let json_to_tF2Error_opt json = 
    jreq json "tF2Error_error" json_to_uint8_opt @@ fun tF2Error_error ->
    jreq json "tF2Error_error_string" json_to_string_opt @@ fun tF2Error_error_string ->
    Some {
    tF2Error_error;
    tF2Error_error_string;
    }

let json_to_lookupTransformActionFeedback_opt json = 
    jreq json "lookupTransformActionFeedback_header" Std_msgs_of_json.json_to_header_opt @@ fun lookupTransformActionFeedback_header ->
    jreq json "lookupTransformActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun lookupTransformActionFeedback_status ->
    jreq json "lookupTransformActionFeedback_feedback" json_to_lookupTransformFeedback_opt @@ fun lookupTransformActionFeedback_feedback ->
    Some {
    lookupTransformActionFeedback_header;
    lookupTransformActionFeedback_status;
    lookupTransformActionFeedback_feedback;
    }

let json_to_lookupTransformResult_opt json = 
    jreq json "lookupTransformResult_transform" Geometry_msgs_of_json.json_to_transformStamped_opt @@ fun lookupTransformResult_transform ->
    jreq json "lookupTransformResult_error" json_to_tF2Error_opt @@ fun lookupTransformResult_error ->
    Some {
    lookupTransformResult_transform;
    lookupTransformResult_error;
    }

let json_to_lookupTransformActionResult_opt json = 
    jreq json "lookupTransformActionResult_header" Std_msgs_of_json.json_to_header_opt @@ fun lookupTransformActionResult_header ->
    jreq json "lookupTransformActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun lookupTransformActionResult_status ->
    jreq json "lookupTransformActionResult_result" json_to_lookupTransformResult_opt @@ fun lookupTransformActionResult_result ->
    Some {
    lookupTransformActionResult_header;
    lookupTransformActionResult_status;
    lookupTransformActionResult_result;
    }

let json_to_lookupTransformAction_opt json = 
    jreq json "action_goal" json_to_lookupTransformActionGoal_opt @@ fun action_goal ->
    jreq json "action_result" json_to_lookupTransformActionResult_opt @@ fun action_result ->
    jreq json "action_feedback" json_to_lookupTransformActionFeedback_opt @@ fun action_feedback ->
    Some {
    action_goal;
    action_result;
    action_feedback;
    }

