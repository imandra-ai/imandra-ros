open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Turtlesim;;

let color_to_json x = [
    ( "r" , x.r |> uint8_to_json );
    ( "g" , x.g |> uint8_to_json );
    ( "b" , x.b |> uint8_to_json );
    ] |> assoc_filter_nulls

let pose_to_json x = [
    ( "x" , x.x |> float32_to_json );
    ( "y" , x.y |> float32_to_json );
    ( "theta" , x.theta |> float32_to_json );
    ( "linear_velocity" , x.linear_velocity |> float32_to_json );
    ( "angular_velocity" , x.angular_velocity |> float32_to_json );
    ] |> assoc_filter_nulls

