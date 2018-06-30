open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Map_msgs;;

let json_to_projectedMap_opt json = 
    jreq json "projectedMap_map" Nav_msgs_of_json.json_to_occupancyGrid_opt @@ fun projectedMap_map ->
    jreq json "projectedMap_min_z" json_to_float64_opt @@ fun projectedMap_min_z ->
    jreq json "projectedMap_max_z" json_to_float64_opt @@ fun projectedMap_max_z ->
    Some {
    projectedMap_map;
    projectedMap_min_z;
    projectedMap_max_z;
    }

let json_to_occupancyGridUpdate_opt json = 
    jreq json "occupancyGridUpdate_header" Std_msgs_of_json.json_to_header_opt @@ fun occupancyGridUpdate_header ->
    jreq json "occupancyGridUpdate_x" json_to_int32_opt @@ fun occupancyGridUpdate_x ->
    jreq json "occupancyGridUpdate_y" json_to_int32_opt @@ fun occupancyGridUpdate_y ->
    jreq json "occupancyGridUpdate_width" json_to_uint32_opt @@ fun occupancyGridUpdate_width ->
    jreq json "occupancyGridUpdate_height" json_to_uint32_opt @@ fun occupancyGridUpdate_height ->
    jreq json "occupancyGridUpdate_data" (jlist json_to_int8_opt) @@ fun occupancyGridUpdate_data ->
    Some {
    occupancyGridUpdate_header;
    occupancyGridUpdate_x;
    occupancyGridUpdate_y;
    occupancyGridUpdate_width;
    occupancyGridUpdate_height;
    occupancyGridUpdate_data;
    }

let json_to_projectedMapInfo_opt json = 
    jreq json "projectedMapInfo_frame_id" json_to_string_opt @@ fun projectedMapInfo_frame_id ->
    jreq json "projectedMapInfo_x" json_to_float64_opt @@ fun projectedMapInfo_x ->
    jreq json "projectedMapInfo_y" json_to_float64_opt @@ fun projectedMapInfo_y ->
    jreq json "projectedMapInfo_width" json_to_float64_opt @@ fun projectedMapInfo_width ->
    jreq json "projectedMapInfo_height" json_to_float64_opt @@ fun projectedMapInfo_height ->
    jreq json "projectedMapInfo_min_z" json_to_float64_opt @@ fun projectedMapInfo_min_z ->
    jreq json "projectedMapInfo_max_z" json_to_float64_opt @@ fun projectedMapInfo_max_z ->
    Some {
    projectedMapInfo_frame_id;
    projectedMapInfo_x;
    projectedMapInfo_y;
    projectedMapInfo_width;
    projectedMapInfo_height;
    projectedMapInfo_min_z;
    projectedMapInfo_max_z;
    }

let json_to_pointCloud2Update_opt json = 
    jreq json "pointCloud2Update_header" Std_msgs_of_json.json_to_header_opt @@ fun pointCloud2Update_header ->
    jreq json "pointCloud2Update_ros_type" json_to_uint32_opt @@ fun pointCloud2Update_ros_type ->
    jreq json "pointCloud2Update_points" Sensor_msgs_of_json.json_to_pointCloud2_opt @@ fun pointCloud2Update_points ->
    Some {
    pointCloud2Update_header;
    pointCloud2Update_ros_type;
    pointCloud2Update_points;
    }

