open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Diagnostic_msgs;;

let json_to_keyValue_opt json = 
    jreq json "key" json_to_string_opt @@ fun key ->
    jreq json "value" json_to_string_opt @@ fun value ->
    Some {
    key;
    value;
    }

let json_to_diagnosticStatus_opt json = 
    jreq json "level" json_to_byte_opt @@ fun level ->
    jreq json "name" json_to_string_opt @@ fun name ->
    jreq json "message" json_to_string_opt @@ fun message ->
    jreq json "hardware_id" json_to_string_opt @@ fun hardware_id ->
    jreq json "values" (jlist json_to_keyValue_opt) @@ fun values ->
    Some {
    level;
    name;
    message;
    hardware_id;
    values;
    }

let json_to_diagnosticArray_opt json = 
    jreq json "header" Std_msgs_of_json.json_to_header_opt @@ fun header ->
    jreq json "status" (jlist json_to_diagnosticStatus_opt) @@ fun status ->
    Some {
    header;
    status;
    }

