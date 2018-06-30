open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Rospy_tutorials;;

let json_to_headerString_opt json = 
    jreq json "headerString_header" Std_msgs_of_json.json_to_header_opt @@ fun headerString_header ->
    jreq json "headerString_data" json_to_string_opt @@ fun headerString_data ->
    Some {
    headerString_header;
    headerString_data;
    }

let json_to_floats_opt json = 
    jreq json "floats_data" (jlist json_to_float32_opt) @@ fun floats_data ->
    Some {
    floats_data;
    }

