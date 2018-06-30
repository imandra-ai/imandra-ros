open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Actionlib_msgs;;

let goalID_to_json x = [
    ( "stamp" , x.stamp |> time_to_json );
    ( "id" , x.id |> string_to_json );
    ] |> assoc_filter_nulls

let goalStatus_to_json x = [
    ( "goal_id" , x.goal_id |> goalID_to_json );
    ( "status" , x.status |> uint8_to_json );
    ( "text" , x.text |> string_to_json );
    ] |> assoc_filter_nulls

let goalStatusArray_to_json x = [
    ( "header" , x.header |> Std_msgs_to_json.header_to_json );
    ( "status_list" , x.status_list |> (mklist goalStatus_to_json) );
    ] |> assoc_filter_nulls

