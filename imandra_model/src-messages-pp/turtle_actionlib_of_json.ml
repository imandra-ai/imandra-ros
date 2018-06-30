open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Turtle_actionlib;;

let json_to_shapeFeedback_opt json : shapeFeedback option = Some ()

let json_to_shapeResult_opt json = 
    jreq json "interior_angle" json_to_float32_opt @@ fun interior_angle ->
    jreq json "apothem" json_to_float32_opt @@ fun apothem ->
    Some {
    interior_angle;
    apothem;
    }

let json_to_shapeGoal_opt json = 
    jreq json "edges" json_to_int32_opt @@ fun edges ->
    jreq json "radius" json_to_float32_opt @@ fun radius ->
    Some {
    edges;
    radius;
    }

let json_to_shapeActionFeedback_opt json = 
    jreq json "shapeActionFeedback_header" Std_msgs_of_json.json_to_header_opt @@ fun shapeActionFeedback_header ->
    jreq json "shapeActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun shapeActionFeedback_status ->
    jreq json "shapeActionFeedback_feedback" json_to_shapeFeedback_opt @@ fun shapeActionFeedback_feedback ->
    Some {
    shapeActionFeedback_header;
    shapeActionFeedback_status;
    shapeActionFeedback_feedback;
    }

let json_to_shapeActionResult_opt json = 
    jreq json "shapeActionResult_header" Std_msgs_of_json.json_to_header_opt @@ fun shapeActionResult_header ->
    jreq json "shapeActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun shapeActionResult_status ->
    jreq json "shapeActionResult_result" json_to_shapeResult_opt @@ fun shapeActionResult_result ->
    Some {
    shapeActionResult_header;
    shapeActionResult_status;
    shapeActionResult_result;
    }

let json_to_velocity_opt json = 
    jreq json "linear" json_to_float32_opt @@ fun linear ->
    jreq json "angular" json_to_float32_opt @@ fun angular ->
    Some {
    linear;
    angular;
    }

let json_to_shapeActionGoal_opt json = 
    jreq json "shapeActionGoal_header" Std_msgs_of_json.json_to_header_opt @@ fun shapeActionGoal_header ->
    jreq json "shapeActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun shapeActionGoal_goal_id ->
    jreq json "shapeActionGoal_goal" json_to_shapeGoal_opt @@ fun shapeActionGoal_goal ->
    Some {
    shapeActionGoal_header;
    shapeActionGoal_goal_id;
    shapeActionGoal_goal;
    }

let json_to_shapeAction_opt json = 
    jreq json "action_goal" json_to_shapeActionGoal_opt @@ fun action_goal ->
    jreq json "action_result" json_to_shapeActionResult_opt @@ fun action_result ->
    jreq json "action_feedback" json_to_shapeActionFeedback_opt @@ fun action_feedback ->
    Some {
    action_goal;
    action_result;
    action_feedback;
    }

