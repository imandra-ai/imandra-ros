open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Stereo_msgs;;

let json_to_disparityImage_opt json = 
    jreq json "image" Sensor_msgs_of_json.json_to_image_opt @@ fun image ->
    jreq json "f" json_to_float32_opt @@ fun f ->
    jreq json "t" json_to_float32_opt @@ fun t ->
    jreq json "valid_window" Sensor_msgs_of_json.json_to_regionOfInterest_opt @@ fun valid_window ->
    jreq json "min_disparity" json_to_float32_opt @@ fun min_disparity ->
    jreq json "max_disparity" json_to_float32_opt @@ fun max_disparity ->
    jreq json "delta_d" json_to_float32_opt @@ fun delta_d ->
    Some {
    image;
    f;
    t;
    valid_window;
    min_disparity;
    max_disparity;
    delta_d;
    }

