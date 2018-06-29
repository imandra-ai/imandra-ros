open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Pcl_msgs;;

let modelCoefficients_to_json x = [
    ( "values" , x.values |> (mklist float32_to_json) );
    ] |> assoc_filter_nulls

let pointIndices_to_json x = [
    ( "indices" , x.indices |> (mklist int32_to_json) );
    ] |> assoc_filter_nulls

let vertices_to_json x = [
    ( "vertices" , x.vertices |> (mklist uint32_to_json) );
    ] |> assoc_filter_nulls

let polygonMesh_to_json x = [
    ( "cloud" , x.cloud |> Sensor_msgs_to_json.pointCloud2_to_json );
    ( "polygons" , x.polygons |> (mklist vertices_to_json) );
    ] |> assoc_filter_nulls

