open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Turtlesim;;

let json_to_color_opt json = 
    jreq json "r" json_to_uint8_opt @@ fun r ->
    jreq json "g" json_to_uint8_opt @@ fun g ->
    jreq json "b" json_to_uint8_opt @@ fun b ->
    Some {
    r;
    g;
    b;
    }

let json_to_pose_opt json = 
    jreq json "x" json_to_float32_opt @@ fun x ->
    jreq json "y" json_to_float32_opt @@ fun y ->
    jreq json "theta" json_to_float32_opt @@ fun theta ->
    jreq json "linear_velocity" json_to_float32_opt @@ fun linear_velocity ->
    jreq json "angular_velocity" json_to_float32_opt @@ fun angular_velocity ->
    Some {
    x;
    y;
    theta;
    linear_velocity;
    angular_velocity;
    }

