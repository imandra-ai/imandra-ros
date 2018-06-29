open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Shape_msgs;;

let solidPrimitive_to_json x = [
    ( "ros_type" , x.ros_type |> uint8_to_json );
    ( "dimensions" , x.dimensions |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let meshTriangle_to_json x = [
    ( "vertex_indices" , x.vertex_indices |> (mklist uint32_to_json) );
    ] |> assoc_filter_nulls

let plane_to_json x = [
    ( "coef" , x.coef |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let mesh_to_json x = [
    ( "triangles" , x.triangles |> (mklist meshTriangle_to_json) );
    ( "vertices" , x.vertices |> (mklist Geometry_msgs_to_json.point_to_json) );
    ] |> assoc_filter_nulls

