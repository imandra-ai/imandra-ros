open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Map_msgs;;

let projectedMap_to_json x = [
    ( "projectedMap_map" , x.projectedMap_map |> Nav_msgs_to_json.occupancyGrid_to_json );
    ( "projectedMap_min_z" , x.projectedMap_min_z |> float64_to_json );
    ( "projectedMap_max_z" , x.projectedMap_max_z |> float64_to_json );
    ] |> assoc_filter_nulls

let occupancyGridUpdate_to_json x = [
    ( "occupancyGridUpdate_x" , x.occupancyGridUpdate_x |> int32_to_json );
    ( "occupancyGridUpdate_y" , x.occupancyGridUpdate_y |> int32_to_json );
    ( "occupancyGridUpdate_width" , x.occupancyGridUpdate_width |> uint32_to_json );
    ( "occupancyGridUpdate_height" , x.occupancyGridUpdate_height |> uint32_to_json );
    ( "occupancyGridUpdate_data" , x.occupancyGridUpdate_data |> (mklist int8_to_json) );
    ] |> assoc_filter_nulls

let projectedMapInfo_to_json x = [
    ( "projectedMapInfo_frame_id" , x.projectedMapInfo_frame_id |> string_to_json );
    ( "projectedMapInfo_x" , x.projectedMapInfo_x |> float64_to_json );
    ( "projectedMapInfo_y" , x.projectedMapInfo_y |> float64_to_json );
    ( "projectedMapInfo_width" , x.projectedMapInfo_width |> float64_to_json );
    ( "projectedMapInfo_height" , x.projectedMapInfo_height |> float64_to_json );
    ( "projectedMapInfo_min_z" , x.projectedMapInfo_min_z |> float64_to_json );
    ( "projectedMapInfo_max_z" , x.projectedMapInfo_max_z |> float64_to_json );
    ] |> assoc_filter_nulls

let pointCloud2Update_to_json x = [
    ( "ros_type" , x.ros_type |> uint32_to_json );
    ( "points" , x.points |> Sensor_msgs_to_json.pointCloud2_to_json );
    ] |> assoc_filter_nulls

