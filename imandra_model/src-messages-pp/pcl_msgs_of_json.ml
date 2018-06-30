open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Pcl_msgs;;

let json_to_modelCoefficients_opt json = 
    jreq json "modelCoefficients_header" Std_msgs_of_json.json_to_header_opt @@ fun modelCoefficients_header ->
    jreq json "modelCoefficients_values" (jlist json_to_float32_opt) @@ fun modelCoefficients_values ->
    Some {
    modelCoefficients_header;
    modelCoefficients_values;
    }

let json_to_pointIndices_opt json = 
    jreq json "pointIndices_header" Std_msgs_of_json.json_to_header_opt @@ fun pointIndices_header ->
    jreq json "pointIndices_indices" (jlist json_to_int32_opt) @@ fun pointIndices_indices ->
    Some {
    pointIndices_header;
    pointIndices_indices;
    }

let json_to_vertices_opt json = 
    jreq json "vertices" (jlist json_to_uint32_opt) @@ fun vertices ->
    Some {
    vertices;
    }

let json_to_polygonMesh_opt json = 
    jreq json "polygonMesh_header" Std_msgs_of_json.json_to_header_opt @@ fun polygonMesh_header ->
    jreq json "polygonMesh_cloud" Sensor_msgs_of_json.json_to_pointCloud2_opt @@ fun polygonMesh_cloud ->
    jreq json "polygonMesh_polygons" (jlist json_to_vertices_opt) @@ fun polygonMesh_polygons ->
    Some {
    polygonMesh_header;
    polygonMesh_cloud;
    polygonMesh_polygons;
    }

