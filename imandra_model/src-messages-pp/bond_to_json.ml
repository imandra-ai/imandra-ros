open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Bond;;

let status_to_json x = [
    ( "header" , x.header |> Std_msgs_to_json.header_to_json );
    ( "id" , x.id |> string_to_json );
    ( "instance_id" , x.instance_id |> string_to_json );
    ( "active" , x.active |> bool_to_json );
    ( "heartbeat_timeout" , x.heartbeat_timeout |> float32_to_json );
    ( "heartbeat_period" , x.heartbeat_period |> float32_to_json );
    ] |> assoc_filter_nulls

let constants_to_json x = `Assoc []

