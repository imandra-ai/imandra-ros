open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Actionlib_msgs;;

let json_to_goalID_opt json = 
    jreq json "stamp" json_to_time_opt @@ fun stamp ->
    jreq json "id" json_to_string_opt @@ fun id ->
    Some {
    stamp;
    id;
    }

let json_to_goalStatus_opt json = 
    jreq json "goal_id" json_to_goalID_opt @@ fun goal_id ->
    jreq json "status" json_to_uint8_opt @@ fun status ->
    jreq json "text" json_to_string_opt @@ fun text ->
    Some {
    goal_id;
    status;
    text;
    }

let json_to_goalStatusArray_opt json = 
    jreq json "header" Std_msgs_of_json.json_to_header_opt @@ fun header ->
    jreq json "status_list" (jlist json_to_goalStatus_opt) @@ fun status_list ->
    Some {
    header;
    status_list;
    }

