open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Tf2_msgs;;

let lookupTransformFeedback_to_json x = `Assoc []

let tFMessage_to_json x = [
    ( "transforms" , x.transforms |> (mklist Geometry_msgs_to_json.transformStamped_to_json) );
    ] |> assoc_filter_nulls

let lookupTransformGoal_to_json x = [
    ( "target_frame" , x.target_frame |> string_to_json );
    ( "source_frame" , x.source_frame |> string_to_json );
    ( "source_time" , x.source_time |> time_to_json );
    ( "timeout" , x.timeout |> duration_to_json );
    ( "target_time" , x.target_time |> time_to_json );
    ( "fixed_frame" , x.fixed_frame |> string_to_json );
    ( "advanced" , x.advanced |> bool_to_json );
    ] |> assoc_filter_nulls

let lookupTransformActionGoal_to_json x = [
    ( "goal_id" , x.goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "goal" , x.goal |> lookupTransformGoal_to_json );
    ] |> assoc_filter_nulls

let tF2Error_to_json x = [
    ( "tF2Error_error" , x.tF2Error_error |> uint8_to_json );
    ( "tF2Error_error_string" , x.tF2Error_error_string |> string_to_json );
    ] |> assoc_filter_nulls

let lookupTransformActionFeedback_to_json x = [
    ( "lookupTransformActionFeedback_status" , x.lookupTransformActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "lookupTransformActionFeedback_feedback" , x.lookupTransformActionFeedback_feedback |> lookupTransformFeedback_to_json );
    ] |> assoc_filter_nulls

let lookupTransformResult_to_json x = [
    ( "lookupTransformResult_transform" , x.lookupTransformResult_transform |> Geometry_msgs_to_json.transformStamped_to_json );
    ( "lookupTransformResult_error" , x.lookupTransformResult_error |> tF2Error_to_json );
    ] |> assoc_filter_nulls

let lookupTransformActionResult_to_json x = [
    ( "lookupTransformActionResult_status" , x.lookupTransformActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "lookupTransformActionResult_result" , x.lookupTransformActionResult_result |> lookupTransformResult_to_json );
    ] |> assoc_filter_nulls

let lookupTransformAction_to_json x = [
    ( "action_goal" , x.action_goal |> lookupTransformActionGoal_to_json );
    ( "action_result" , x.action_result |> lookupTransformActionResult_to_json );
    ( "action_feedback" , x.action_feedback |> lookupTransformActionFeedback_to_json );
    ] |> assoc_filter_nulls

