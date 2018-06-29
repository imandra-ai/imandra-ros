open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Pcl_msgs;;

let json_to_modelCoefficients_opt json = 
    jreq json "values" (jlist json_to_float32_opt) @@ fun values ->
    Some {
    values;
    }

let json_to_pointIndices_opt json = 
    jreq json "indices" (jlist json_to_int32_opt) @@ fun indices ->
    Some {
    indices;
    }

let json_to_vertices_opt json = 
    jreq json "vertices" (jlist json_to_uint32_opt) @@ fun vertices ->
    Some {
    vertices;
    }

let json_to_polygonMesh_opt json = 
    jreq json "cloud" Sensor_msgs_of_json.json_to_pointCloud2_opt @@ fun cloud ->
    jreq json "polygons" (jlist json_to_vertices_opt) @@ fun polygons ->
    Some {
    cloud;
    polygons;
    }

