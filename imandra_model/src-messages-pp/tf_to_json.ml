open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Tf;;

let tfMessage_to_json x = [
    ( "transforms" , x.transforms |> (mklist Geometry_msgs_to_json.transformStamped_to_json) );
    ] |> assoc_filter_nulls

