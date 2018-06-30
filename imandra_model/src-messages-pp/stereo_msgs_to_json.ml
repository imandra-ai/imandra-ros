open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Stereo_msgs;;

let disparityImage_to_json x = [
    ( "header" , x.header |> Std_msgs_to_json.header_to_json );
    ( "image" , x.image |> Sensor_msgs_to_json.image_to_json );
    ( "f" , x.f |> float32_to_json );
    ( "t" , x.t |> float32_to_json );
    ( "valid_window" , x.valid_window |> Sensor_msgs_to_json.regionOfInterest_to_json );
    ( "min_disparity" , x.min_disparity |> float32_to_json );
    ( "max_disparity" , x.max_disparity |> float32_to_json );
    ( "delta_d" , x.delta_d |> float32_to_json );
    ] |> assoc_filter_nulls

