open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Actionlib_tutorials;;

let json_to_fibonacciGoal_opt json = 
    jreq json "order" json_to_int32_opt @@ fun order ->
    Some {
    order;
    }

let json_to_fibonacciFeedback_opt json = 
    jreq json "fibonacciFeedback_sequence" (jlist json_to_int32_opt) @@ fun fibonacciFeedback_sequence ->
    Some {
    fibonacciFeedback_sequence;
    }

let json_to_averagingGoal_opt json = 
    jreq json "samples" json_to_int32_opt @@ fun samples ->
    Some {
    samples;
    }

let json_to_averagingFeedback_opt json = 
    jreq json "averagingFeedback_sample" json_to_int32_opt @@ fun averagingFeedback_sample ->
    jreq json "averagingFeedback_data" json_to_float32_opt @@ fun averagingFeedback_data ->
    jreq json "averagingFeedback_mean" json_to_float32_opt @@ fun averagingFeedback_mean ->
    jreq json "averagingFeedback_std_dev" json_to_float32_opt @@ fun averagingFeedback_std_dev ->
    Some {
    averagingFeedback_sample;
    averagingFeedback_data;
    averagingFeedback_mean;
    averagingFeedback_std_dev;
    }

let json_to_fibonacciActionFeedback_opt json = 
    jreq json "fibonacciActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun fibonacciActionFeedback_status ->
    jreq json "fibonacciActionFeedback_feedback" json_to_fibonacciFeedback_opt @@ fun fibonacciActionFeedback_feedback ->
    Some {
    fibonacciActionFeedback_status;
    fibonacciActionFeedback_feedback;
    }

let json_to_fibonacciResult_opt json = 
    jreq json "fibonacciResult_sequence" (jlist json_to_int32_opt) @@ fun fibonacciResult_sequence ->
    Some {
    fibonacciResult_sequence;
    }

let json_to_averagingResult_opt json = 
    jreq json "averagingResult_mean" json_to_float32_opt @@ fun averagingResult_mean ->
    jreq json "averagingResult_std_dev" json_to_float32_opt @@ fun averagingResult_std_dev ->
    Some {
    averagingResult_mean;
    averagingResult_std_dev;
    }

let json_to_fibonacciActionGoal_opt json = 
    jreq json "fibonacciActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun fibonacciActionGoal_goal_id ->
    jreq json "fibonacciActionGoal_goal" json_to_fibonacciGoal_opt @@ fun fibonacciActionGoal_goal ->
    Some {
    fibonacciActionGoal_goal_id;
    fibonacciActionGoal_goal;
    }

let json_to_fibonacciActionResult_opt json = 
    jreq json "fibonacciActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun fibonacciActionResult_status ->
    jreq json "fibonacciActionResult_result" json_to_fibonacciResult_opt @@ fun fibonacciActionResult_result ->
    Some {
    fibonacciActionResult_status;
    fibonacciActionResult_result;
    }

let json_to_averagingActionGoal_opt json = 
    jreq json "averagingActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun averagingActionGoal_goal_id ->
    jreq json "averagingActionGoal_goal" json_to_averagingGoal_opt @@ fun averagingActionGoal_goal ->
    Some {
    averagingActionGoal_goal_id;
    averagingActionGoal_goal;
    }

let json_to_averagingActionFeedback_opt json = 
    jreq json "averagingActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun averagingActionFeedback_status ->
    jreq json "averagingActionFeedback_feedback" json_to_averagingFeedback_opt @@ fun averagingActionFeedback_feedback ->
    Some {
    averagingActionFeedback_status;
    averagingActionFeedback_feedback;
    }

let json_to_averagingActionResult_opt json = 
    jreq json "averagingActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun averagingActionResult_status ->
    jreq json "averagingActionResult_result" json_to_averagingResult_opt @@ fun averagingActionResult_result ->
    Some {
    averagingActionResult_status;
    averagingActionResult_result;
    }

let json_to_fibonacciAction_opt json = 
    jreq json "fibonacciAction_action_goal" json_to_fibonacciActionGoal_opt @@ fun fibonacciAction_action_goal ->
    jreq json "fibonacciAction_action_result" json_to_fibonacciActionResult_opt @@ fun fibonacciAction_action_result ->
    jreq json "fibonacciAction_action_feedback" json_to_fibonacciActionFeedback_opt @@ fun fibonacciAction_action_feedback ->
    Some {
    fibonacciAction_action_goal;
    fibonacciAction_action_result;
    fibonacciAction_action_feedback;
    }

let json_to_averagingAction_opt json = 
    jreq json "averagingAction_action_goal" json_to_averagingActionGoal_opt @@ fun averagingAction_action_goal ->
    jreq json "averagingAction_action_result" json_to_averagingActionResult_opt @@ fun averagingAction_action_result ->
    jreq json "averagingAction_action_feedback" json_to_averagingActionFeedback_opt @@ fun averagingAction_action_feedback ->
    Some {
    averagingAction_action_goal;
    averagingAction_action_result;
    averagingAction_action_feedback;
    }

