open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Visualization_msgs;;

let interactiveMarkerPose_to_json x = [
    ( "interactiveMarkerPose_pose" , x.interactiveMarkerPose_pose |> Geometry_msgs_to_json.pose_to_json );
    ( "interactiveMarkerPose_name" , x.interactiveMarkerPose_name |> string_to_json );
    ] |> assoc_filter_nulls

let menuEntry_to_json x = [
    ( "menuEntry_id" , x.menuEntry_id |> uint32_to_json );
    ( "menuEntry_parent_id" , x.menuEntry_parent_id |> uint32_to_json );
    ( "menuEntry_title" , x.menuEntry_title |> string_to_json );
    ( "menuEntry_command" , x.menuEntry_command |> string_to_json );
    ( "menuEntry_command_type" , x.menuEntry_command_type |> uint8_to_json );
    ] |> assoc_filter_nulls

let interactiveMarkerFeedback_to_json x = [
    ( "interactiveMarkerFeedback_client_id" , x.interactiveMarkerFeedback_client_id |> string_to_json );
    ( "interactiveMarkerFeedback_marker_name" , x.interactiveMarkerFeedback_marker_name |> string_to_json );
    ( "interactiveMarkerFeedback_control_name" , x.interactiveMarkerFeedback_control_name |> string_to_json );
    ( "interactiveMarkerFeedback_event_type" , x.interactiveMarkerFeedback_event_type |> uint8_to_json );
    ( "interactiveMarkerFeedback_pose" , x.interactiveMarkerFeedback_pose |> Geometry_msgs_to_json.pose_to_json );
    ( "interactiveMarkerFeedback_menu_entry_id" , x.interactiveMarkerFeedback_menu_entry_id |> uint32_to_json );
    ( "interactiveMarkerFeedback_mouse_point" , x.interactiveMarkerFeedback_mouse_point |> Geometry_msgs_to_json.point_to_json );
    ( "interactiveMarkerFeedback_mouse_point_valid" , x.interactiveMarkerFeedback_mouse_point_valid |> bool_to_json );
    ] |> assoc_filter_nulls

let marker_to_json x = [
    ( "marker_ns" , x.marker_ns |> string_to_json );
    ( "marker_id" , x.marker_id |> int32_to_json );
    ( "marker_ros_type" , x.marker_ros_type |> int32_to_json );
    ( "marker_action" , x.marker_action |> int32_to_json );
    ( "marker_pose" , x.marker_pose |> Geometry_msgs_to_json.pose_to_json );
    ( "marker_scale" , x.marker_scale |> Geometry_msgs_to_json.vector3_to_json );
    ( "marker_color" , x.marker_color |> Std_msgs_to_json.colorRGBA_to_json );
    ( "marker_lifetime" , x.marker_lifetime |> duration_to_json );
    ( "marker_frame_locked" , x.marker_frame_locked |> bool_to_json );
    ( "marker_points" , x.marker_points |> (mklist Geometry_msgs_to_json.point_to_json) );
    ( "marker_colors" , x.marker_colors |> (mklist Std_msgs_to_json.colorRGBA_to_json) );
    ( "marker_text" , x.marker_text |> string_to_json );
    ( "marker_mesh_resource" , x.marker_mesh_resource |> string_to_json );
    ( "marker_mesh_use_embedded_materials" , x.marker_mesh_use_embedded_materials |> bool_to_json );
    ] |> assoc_filter_nulls

let imageMarker_to_json x = [
    ( "imageMarker_ns" , x.imageMarker_ns |> string_to_json );
    ( "imageMarker_id" , x.imageMarker_id |> int32_to_json );
    ( "imageMarker_ros_type" , x.imageMarker_ros_type |> int32_to_json );
    ( "imageMarker_action" , x.imageMarker_action |> int32_to_json );
    ( "imageMarker_position" , x.imageMarker_position |> Geometry_msgs_to_json.point_to_json );
    ( "imageMarker_scale" , x.imageMarker_scale |> float32_to_json );
    ( "imageMarker_outline_color" , x.imageMarker_outline_color |> Std_msgs_to_json.colorRGBA_to_json );
    ( "imageMarker_filled" , x.imageMarker_filled |> uint8_to_json );
    ( "imageMarker_fill_color" , x.imageMarker_fill_color |> Std_msgs_to_json.colorRGBA_to_json );
    ( "imageMarker_lifetime" , x.imageMarker_lifetime |> duration_to_json );
    ( "imageMarker_points" , x.imageMarker_points |> (mklist Geometry_msgs_to_json.point_to_json) );
    ( "imageMarker_outline_colors" , x.imageMarker_outline_colors |> (mklist Std_msgs_to_json.colorRGBA_to_json) );
    ] |> assoc_filter_nulls

let markerArray_to_json x = [
    ( "markerArray_markers" , x.markerArray_markers |> (mklist marker_to_json) );
    ] |> assoc_filter_nulls

let interactiveMarkerControl_to_json x = [
    ( "interactiveMarkerControl_name" , x.interactiveMarkerControl_name |> string_to_json );
    ( "interactiveMarkerControl_orientation" , x.interactiveMarkerControl_orientation |> Geometry_msgs_to_json.quaternion_to_json );
    ( "interactiveMarkerControl_orientation_mode" , x.interactiveMarkerControl_orientation_mode |> uint8_to_json );
    ( "interactiveMarkerControl_interaction_mode" , x.interactiveMarkerControl_interaction_mode |> uint8_to_json );
    ( "interactiveMarkerControl_always_visible" , x.interactiveMarkerControl_always_visible |> bool_to_json );
    ( "interactiveMarkerControl_markers" , x.interactiveMarkerControl_markers |> (mklist marker_to_json) );
    ( "interactiveMarkerControl_independent_marker_orientation" , x.interactiveMarkerControl_independent_marker_orientation |> bool_to_json );
    ( "interactiveMarkerControl_description" , x.interactiveMarkerControl_description |> string_to_json );
    ] |> assoc_filter_nulls

let interactiveMarker_to_json x = [
    ( "interactiveMarker_pose" , x.interactiveMarker_pose |> Geometry_msgs_to_json.pose_to_json );
    ( "interactiveMarker_name" , x.interactiveMarker_name |> string_to_json );
    ( "interactiveMarker_description" , x.interactiveMarker_description |> string_to_json );
    ( "interactiveMarker_scale" , x.interactiveMarker_scale |> float32_to_json );
    ( "interactiveMarker_menu_entries" , x.interactiveMarker_menu_entries |> (mklist menuEntry_to_json) );
    ( "interactiveMarker_controls" , x.interactiveMarker_controls |> (mklist interactiveMarkerControl_to_json) );
    ] |> assoc_filter_nulls

let interactiveMarkerInit_to_json x = [
    ( "interactiveMarkerInit_server_id" , x.interactiveMarkerInit_server_id |> string_to_json );
    ( "interactiveMarkerInit_seq_num" , x.interactiveMarkerInit_seq_num |> uint64_to_json );
    ( "interactiveMarkerInit_markers" , x.interactiveMarkerInit_markers |> (mklist interactiveMarker_to_json) );
    ] |> assoc_filter_nulls

let interactiveMarkerUpdate_to_json x = [
    ( "interactiveMarkerUpdate_server_id" , x.interactiveMarkerUpdate_server_id |> string_to_json );
    ( "interactiveMarkerUpdate_seq_num" , x.interactiveMarkerUpdate_seq_num |> uint64_to_json );
    ( "interactiveMarkerUpdate_ros_type" , x.interactiveMarkerUpdate_ros_type |> uint8_to_json );
    ( "interactiveMarkerUpdate_markers" , x.interactiveMarkerUpdate_markers |> (mklist interactiveMarker_to_json) );
    ( "interactiveMarkerUpdate_poses" , x.interactiveMarkerUpdate_poses |> (mklist interactiveMarkerPose_to_json) );
    ( "interactiveMarkerUpdate_erases" , x.interactiveMarkerUpdate_erases |> (mklist string_to_json) );
    ] |> assoc_filter_nulls

