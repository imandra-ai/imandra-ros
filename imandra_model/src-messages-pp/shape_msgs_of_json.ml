open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Shape_msgs;;

let json_to_solidPrimitive_opt json = 
    jreq json "ros_type" json_to_uint8_opt @@ fun ros_type ->
    jreq json "dimensions" (jlist json_to_float64_opt) @@ fun dimensions ->
    Some {
    ros_type;
    dimensions;
    }

let json_to_meshTriangle_opt json = 
    jreq json "vertex_indices" (jlist json_to_uint32_opt) @@ fun vertex_indices ->
    Some {
    vertex_indices;
    }

let json_to_plane_opt json = 
    jreq json "coef" (jlist json_to_float64_opt) @@ fun coef ->
    Some {
    coef;
    }

let json_to_mesh_opt json = 
    jreq json "triangles" (jlist json_to_meshTriangle_opt) @@ fun triangles ->
    jreq json "vertices" (jlist Geometry_msgs_of_json.json_to_point_opt) @@ fun vertices ->
    Some {
    triangles;
    vertices;
    }

