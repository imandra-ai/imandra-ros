open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Actionlib;;

let json_to_testRequestResult_opt json = 
    jreq json "testRequestResult_the_result" json_to_int32_opt @@ fun testRequestResult_the_result ->
    jreq json "testRequestResult_is_simple_server" json_to_bool_opt @@ fun testRequestResult_is_simple_server ->
    Some {
    testRequestResult_the_result;
    testRequestResult_is_simple_server;
    }

let json_to_testResult_opt json = 
    jreq json "testResult_result" json_to_int32_opt @@ fun testResult_result ->
    Some {
    testResult_result;
    }

let json_to_twoIntsFeedback_opt json : twoIntsFeedback option = Some ()

let json_to_testFeedback_opt json = 
    jreq json "testFeedback_feedback" json_to_int32_opt @@ fun testFeedback_feedback ->
    Some {
    testFeedback_feedback;
    }

let json_to_twoIntsActionFeedback_opt json = 
    jreq json "twoIntsActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun twoIntsActionFeedback_status ->
    jreq json "twoIntsActionFeedback_feedback" json_to_twoIntsFeedback_opt @@ fun twoIntsActionFeedback_feedback ->
    Some {
    twoIntsActionFeedback_status;
    twoIntsActionFeedback_feedback;
    }

let json_to_testActionResult_opt json = 
    jreq json "testActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun testActionResult_status ->
    jreq json "testActionResult_result" json_to_testResult_opt @@ fun testActionResult_result ->
    Some {
    testActionResult_status;
    testActionResult_result;
    }

let json_to_testGoal_opt json = 
    jreq json "testGoal_goal" json_to_int32_opt @@ fun testGoal_goal ->
    Some {
    testGoal_goal;
    }

let json_to_twoIntsResult_opt json = 
    jreq json "sum" json_to_int64_opt @@ fun sum ->
    Some {
    sum;
    }

let json_to_testRequestActionResult_opt json = 
    jreq json "testRequestActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun testRequestActionResult_status ->
    jreq json "testRequestActionResult_result" json_to_testRequestResult_opt @@ fun testRequestActionResult_result ->
    Some {
    testRequestActionResult_status;
    testRequestActionResult_result;
    }

let json_to_twoIntsGoal_opt json = 
    jreq json "a" json_to_int64_opt @@ fun a ->
    jreq json "b" json_to_int64_opt @@ fun b ->
    Some {
    a;
    b;
    }

let json_to_testRequestFeedback_opt json : testRequestFeedback option = Some ()

let json_to_testRequestGoal_opt json = 
    jreq json "testRequestGoal_terminate_status" json_to_int32_opt @@ fun testRequestGoal_terminate_status ->
    jreq json "testRequestGoal_ignore_cancel" json_to_bool_opt @@ fun testRequestGoal_ignore_cancel ->
    jreq json "testRequestGoal_result_text" json_to_string_opt @@ fun testRequestGoal_result_text ->
    jreq json "testRequestGoal_the_result" json_to_int32_opt @@ fun testRequestGoal_the_result ->
    jreq json "testRequestGoal_is_simple_client" json_to_bool_opt @@ fun testRequestGoal_is_simple_client ->
    jreq json "testRequestGoal_delay_accept" json_to_duration_opt @@ fun testRequestGoal_delay_accept ->
    jreq json "testRequestGoal_delay_terminate" json_to_duration_opt @@ fun testRequestGoal_delay_terminate ->
    jreq json "testRequestGoal_pause_status" json_to_duration_opt @@ fun testRequestGoal_pause_status ->
    Some {
    testRequestGoal_terminate_status;
    testRequestGoal_ignore_cancel;
    testRequestGoal_result_text;
    testRequestGoal_the_result;
    testRequestGoal_is_simple_client;
    testRequestGoal_delay_accept;
    testRequestGoal_delay_terminate;
    testRequestGoal_pause_status;
    }

let json_to_testRequestActionGoal_opt json = 
    jreq json "testRequestActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun testRequestActionGoal_goal_id ->
    jreq json "testRequestActionGoal_goal" json_to_testRequestGoal_opt @@ fun testRequestActionGoal_goal ->
    Some {
    testRequestActionGoal_goal_id;
    testRequestActionGoal_goal;
    }

let json_to_testActionFeedback_opt json = 
    jreq json "testActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun testActionFeedback_status ->
    jreq json "testActionFeedback_feedback" json_to_testFeedback_opt @@ fun testActionFeedback_feedback ->
    Some {
    testActionFeedback_status;
    testActionFeedback_feedback;
    }

let json_to_twoIntsActionGoal_opt json = 
    jreq json "twoIntsActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun twoIntsActionGoal_goal_id ->
    jreq json "twoIntsActionGoal_goal" json_to_twoIntsGoal_opt @@ fun twoIntsActionGoal_goal ->
    Some {
    twoIntsActionGoal_goal_id;
    twoIntsActionGoal_goal;
    }

let json_to_testActionGoal_opt json = 
    jreq json "testActionGoal_goal_id" Actionlib_msgs_of_json.json_to_goalID_opt @@ fun testActionGoal_goal_id ->
    jreq json "testActionGoal_goal" json_to_testGoal_opt @@ fun testActionGoal_goal ->
    Some {
    testActionGoal_goal_id;
    testActionGoal_goal;
    }

let json_to_twoIntsActionResult_opt json = 
    jreq json "twoIntsActionResult_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun twoIntsActionResult_status ->
    jreq json "twoIntsActionResult_result" json_to_twoIntsResult_opt @@ fun twoIntsActionResult_result ->
    Some {
    twoIntsActionResult_status;
    twoIntsActionResult_result;
    }

let json_to_twoIntsAction_opt json = 
    jreq json "twoIntsAction_action_goal" json_to_twoIntsActionGoal_opt @@ fun twoIntsAction_action_goal ->
    jreq json "twoIntsAction_action_result" json_to_twoIntsActionResult_opt @@ fun twoIntsAction_action_result ->
    jreq json "twoIntsAction_action_feedback" json_to_twoIntsActionFeedback_opt @@ fun twoIntsAction_action_feedback ->
    Some {
    twoIntsAction_action_goal;
    twoIntsAction_action_result;
    twoIntsAction_action_feedback;
    }

let json_to_testRequestActionFeedback_opt json = 
    jreq json "testRequestActionFeedback_status" Actionlib_msgs_of_json.json_to_goalStatus_opt @@ fun testRequestActionFeedback_status ->
    jreq json "testRequestActionFeedback_feedback" json_to_testRequestFeedback_opt @@ fun testRequestActionFeedback_feedback ->
    Some {
    testRequestActionFeedback_status;
    testRequestActionFeedback_feedback;
    }

let json_to_testRequestAction_opt json = 
    jreq json "testRequestAction_action_goal" json_to_testRequestActionGoal_opt @@ fun testRequestAction_action_goal ->
    jreq json "testRequestAction_action_result" json_to_testRequestActionResult_opt @@ fun testRequestAction_action_result ->
    jreq json "testRequestAction_action_feedback" json_to_testRequestActionFeedback_opt @@ fun testRequestAction_action_feedback ->
    Some {
    testRequestAction_action_goal;
    testRequestAction_action_result;
    testRequestAction_action_feedback;
    }

let json_to_testAction_opt json = 
    jreq json "testAction_action_goal" json_to_testActionGoal_opt @@ fun testAction_action_goal ->
    jreq json "testAction_action_result" json_to_testActionResult_opt @@ fun testAction_action_result ->
    jreq json "testAction_action_feedback" json_to_testActionFeedback_opt @@ fun testAction_action_feedback ->
    Some {
    testAction_action_goal;
    testAction_action_result;
    testAction_action_feedback;
    }

