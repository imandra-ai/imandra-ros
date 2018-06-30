open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Pcl_msgs;;

let modelCoefficients_to_json x = [
    ( "modelCoefficients_header" , x.modelCoefficients_header |> Std_msgs_to_json.header_to_json );
    ( "modelCoefficients_values" , x.modelCoefficients_values |> (mklist float32_to_json) );
    ] |> assoc_filter_nulls

let pointIndices_to_json x = [
    ( "pointIndices_header" , x.pointIndices_header |> Std_msgs_to_json.header_to_json );
    ( "pointIndices_indices" , x.pointIndices_indices |> (mklist int32_to_json) );
    ] |> assoc_filter_nulls

let vertices_to_json x = [
    ( "vertices" , x.vertices |> (mklist uint32_to_json) );
    ] |> assoc_filter_nulls

let polygonMesh_to_json x = [
    ( "polygonMesh_header" , x.polygonMesh_header |> Std_msgs_to_json.header_to_json );
    ( "polygonMesh_cloud" , x.polygonMesh_cloud |> Sensor_msgs_to_json.pointCloud2_to_json );
    ( "polygonMesh_polygons" , x.polygonMesh_polygons |> (mklist vertices_to_json) );
    ] |> assoc_filter_nulls

