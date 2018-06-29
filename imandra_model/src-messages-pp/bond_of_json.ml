open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Bond;;

let json_to_status_opt json = 
    jreq json "id" json_to_string_opt @@ fun id ->
    jreq json "instance_id" json_to_string_opt @@ fun instance_id ->
    jreq json "active" json_to_bool_opt @@ fun active ->
    jreq json "heartbeat_timeout" json_to_float32_opt @@ fun heartbeat_timeout ->
    jreq json "heartbeat_period" json_to_float32_opt @@ fun heartbeat_period ->
    Some {
    id;
    instance_id;
    active;
    heartbeat_timeout;
    heartbeat_period;
    }

let json_to_constants_opt json : constants option = Some ()

