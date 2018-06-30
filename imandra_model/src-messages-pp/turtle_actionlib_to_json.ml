open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Turtle_actionlib;;

let shapeFeedback_to_json x = `Assoc []

let shapeResult_to_json x = [
    ( "interior_angle" , x.interior_angle |> float32_to_json );
    ( "apothem" , x.apothem |> float32_to_json );
    ] |> assoc_filter_nulls

let shapeGoal_to_json x = [
    ( "edges" , x.edges |> int32_to_json );
    ( "radius" , x.radius |> float32_to_json );
    ] |> assoc_filter_nulls

let shapeActionFeedback_to_json x = [
    ( "shapeActionFeedback_header" , x.shapeActionFeedback_header |> Std_msgs_to_json.header_to_json );
    ( "shapeActionFeedback_status" , x.shapeActionFeedback_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "shapeActionFeedback_feedback" , x.shapeActionFeedback_feedback |> shapeFeedback_to_json );
    ] |> assoc_filter_nulls

let shapeActionResult_to_json x = [
    ( "shapeActionResult_header" , x.shapeActionResult_header |> Std_msgs_to_json.header_to_json );
    ( "shapeActionResult_status" , x.shapeActionResult_status |> Actionlib_msgs_to_json.goalStatus_to_json );
    ( "shapeActionResult_result" , x.shapeActionResult_result |> shapeResult_to_json );
    ] |> assoc_filter_nulls

let velocity_to_json x = [
    ( "linear" , x.linear |> float32_to_json );
    ( "angular" , x.angular |> float32_to_json );
    ] |> assoc_filter_nulls

let shapeActionGoal_to_json x = [
    ( "shapeActionGoal_header" , x.shapeActionGoal_header |> Std_msgs_to_json.header_to_json );
    ( "shapeActionGoal_goal_id" , x.shapeActionGoal_goal_id |> Actionlib_msgs_to_json.goalID_to_json );
    ( "shapeActionGoal_goal" , x.shapeActionGoal_goal |> shapeGoal_to_json );
    ] |> assoc_filter_nulls

let shapeAction_to_json x = [
    ( "action_goal" , x.action_goal |> shapeActionGoal_to_json );
    ( "action_result" , x.action_result |> shapeActionResult_to_json );
    ( "action_feedback" , x.action_feedback |> shapeActionFeedback_to_json );
    ] |> assoc_filter_nulls

