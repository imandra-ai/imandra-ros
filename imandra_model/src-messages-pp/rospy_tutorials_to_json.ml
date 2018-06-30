open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Rospy_tutorials;;

let headerString_to_json x = [
    ( "headerString_header" , x.headerString_header |> Std_msgs_to_json.header_to_json );
    ( "headerString_data" , x.headerString_data |> string_to_json );
    ] |> assoc_filter_nulls

let floats_to_json x = [
    ( "floats_data" , x.floats_data |> (mklist float32_to_json) );
    ] |> assoc_filter_nulls

