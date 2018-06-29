open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Visualization_msgs;;

let json_to_interactiveMarkerPose_opt json = 
    jreq json "interactiveMarkerPose_pose" Geometry_msgs_of_json.json_to_pose_opt @@ fun interactiveMarkerPose_pose ->
    jreq json "interactiveMarkerPose_name" json_to_string_opt @@ fun interactiveMarkerPose_name ->
    Some {
    interactiveMarkerPose_pose;
    interactiveMarkerPose_name;
    }

let json_to_menuEntry_opt json = 
    jreq json "menuEntry_id" json_to_uint32_opt @@ fun menuEntry_id ->
    jreq json "menuEntry_parent_id" json_to_uint32_opt @@ fun menuEntry_parent_id ->
    jreq json "menuEntry_title" json_to_string_opt @@ fun menuEntry_title ->
    jreq json "menuEntry_command" json_to_string_opt @@ fun menuEntry_command ->
    jreq json "menuEntry_command_type" json_to_uint8_opt @@ fun menuEntry_command_type ->
    Some {
    menuEntry_id;
    menuEntry_parent_id;
    menuEntry_title;
    menuEntry_command;
    menuEntry_command_type;
    }

let json_to_interactiveMarkerFeedback_opt json = 
    jreq json "interactiveMarkerFeedback_client_id" json_to_string_opt @@ fun interactiveMarkerFeedback_client_id ->
    jreq json "interactiveMarkerFeedback_marker_name" json_to_string_opt @@ fun interactiveMarkerFeedback_marker_name ->
    jreq json "interactiveMarkerFeedback_control_name" json_to_string_opt @@ fun interactiveMarkerFeedback_control_name ->
    jreq json "interactiveMarkerFeedback_event_type" json_to_uint8_opt @@ fun interactiveMarkerFeedback_event_type ->
    jreq json "interactiveMarkerFeedback_pose" Geometry_msgs_of_json.json_to_pose_opt @@ fun interactiveMarkerFeedback_pose ->
    jreq json "interactiveMarkerFeedback_menu_entry_id" json_to_uint32_opt @@ fun interactiveMarkerFeedback_menu_entry_id ->
    jreq json "interactiveMarkerFeedback_mouse_point" Geometry_msgs_of_json.json_to_point_opt @@ fun interactiveMarkerFeedback_mouse_point ->
    jreq json "interactiveMarkerFeedback_mouse_point_valid" json_to_bool_opt @@ fun interactiveMarkerFeedback_mouse_point_valid ->
    Some {
    interactiveMarkerFeedback_client_id;
    interactiveMarkerFeedback_marker_name;
    interactiveMarkerFeedback_control_name;
    interactiveMarkerFeedback_event_type;
    interactiveMarkerFeedback_pose;
    interactiveMarkerFeedback_menu_entry_id;
    interactiveMarkerFeedback_mouse_point;
    interactiveMarkerFeedback_mouse_point_valid;
    }

let json_to_marker_opt json = 
    jreq json "marker_ns" json_to_string_opt @@ fun marker_ns ->
    jreq json "marker_id" json_to_int32_opt @@ fun marker_id ->
    jreq json "marker_ros_type" json_to_int32_opt @@ fun marker_ros_type ->
    jreq json "marker_action" json_to_int32_opt @@ fun marker_action ->
    jreq json "marker_pose" Geometry_msgs_of_json.json_to_pose_opt @@ fun marker_pose ->
    jreq json "marker_scale" Geometry_msgs_of_json.json_to_vector3_opt @@ fun marker_scale ->
    jreq json "marker_color" Std_msgs_of_json.json_to_colorRGBA_opt @@ fun marker_color ->
    jreq json "marker_lifetime" json_to_duration_opt @@ fun marker_lifetime ->
    jreq json "marker_frame_locked" json_to_bool_opt @@ fun marker_frame_locked ->
    jreq json "marker_points" (jlist Geometry_msgs_of_json.json_to_point_opt) @@ fun marker_points ->
    jreq json "marker_colors" (jlist Std_msgs_of_json.json_to_colorRGBA_opt) @@ fun marker_colors ->
    jreq json "marker_text" json_to_string_opt @@ fun marker_text ->
    jreq json "marker_mesh_resource" json_to_string_opt @@ fun marker_mesh_resource ->
    jreq json "marker_mesh_use_embedded_materials" json_to_bool_opt @@ fun marker_mesh_use_embedded_materials ->
    Some {
    marker_ns;
    marker_id;
    marker_ros_type;
    marker_action;
    marker_pose;
    marker_scale;
    marker_color;
    marker_lifetime;
    marker_frame_locked;
    marker_points;
    marker_colors;
    marker_text;
    marker_mesh_resource;
    marker_mesh_use_embedded_materials;
    }

let json_to_imageMarker_opt json = 
    jreq json "imageMarker_ns" json_to_string_opt @@ fun imageMarker_ns ->
    jreq json "imageMarker_id" json_to_int32_opt @@ fun imageMarker_id ->
    jreq json "imageMarker_ros_type" json_to_int32_opt @@ fun imageMarker_ros_type ->
    jreq json "imageMarker_action" json_to_int32_opt @@ fun imageMarker_action ->
    jreq json "imageMarker_position" Geometry_msgs_of_json.json_to_point_opt @@ fun imageMarker_position ->
    jreq json "imageMarker_scale" json_to_float32_opt @@ fun imageMarker_scale ->
    jreq json "imageMarker_outline_color" Std_msgs_of_json.json_to_colorRGBA_opt @@ fun imageMarker_outline_color ->
    jreq json "imageMarker_filled" json_to_uint8_opt @@ fun imageMarker_filled ->
    jreq json "imageMarker_fill_color" Std_msgs_of_json.json_to_colorRGBA_opt @@ fun imageMarker_fill_color ->
    jreq json "imageMarker_lifetime" json_to_duration_opt @@ fun imageMarker_lifetime ->
    jreq json "imageMarker_points" (jlist Geometry_msgs_of_json.json_to_point_opt) @@ fun imageMarker_points ->
    jreq json "imageMarker_outline_colors" (jlist Std_msgs_of_json.json_to_colorRGBA_opt) @@ fun imageMarker_outline_colors ->
    Some {
    imageMarker_ns;
    imageMarker_id;
    imageMarker_ros_type;
    imageMarker_action;
    imageMarker_position;
    imageMarker_scale;
    imageMarker_outline_color;
    imageMarker_filled;
    imageMarker_fill_color;
    imageMarker_lifetime;
    imageMarker_points;
    imageMarker_outline_colors;
    }

let json_to_markerArray_opt json = 
    jreq json "markerArray_markers" (jlist json_to_marker_opt) @@ fun markerArray_markers ->
    Some {
    markerArray_markers;
    }

let json_to_interactiveMarkerControl_opt json = 
    jreq json "interactiveMarkerControl_name" json_to_string_opt @@ fun interactiveMarkerControl_name ->
    jreq json "interactiveMarkerControl_orientation" Geometry_msgs_of_json.json_to_quaternion_opt @@ fun interactiveMarkerControl_orientation ->
    jreq json "interactiveMarkerControl_orientation_mode" json_to_uint8_opt @@ fun interactiveMarkerControl_orientation_mode ->
    jreq json "interactiveMarkerControl_interaction_mode" json_to_uint8_opt @@ fun interactiveMarkerControl_interaction_mode ->
    jreq json "interactiveMarkerControl_always_visible" json_to_bool_opt @@ fun interactiveMarkerControl_always_visible ->
    jreq json "interactiveMarkerControl_markers" (jlist json_to_marker_opt) @@ fun interactiveMarkerControl_markers ->
    jreq json "interactiveMarkerControl_independent_marker_orientation" json_to_bool_opt @@ fun interactiveMarkerControl_independent_marker_orientation ->
    jreq json "interactiveMarkerControl_description" json_to_string_opt @@ fun interactiveMarkerControl_description ->
    Some {
    interactiveMarkerControl_name;
    interactiveMarkerControl_orientation;
    interactiveMarkerControl_orientation_mode;
    interactiveMarkerControl_interaction_mode;
    interactiveMarkerControl_always_visible;
    interactiveMarkerControl_markers;
    interactiveMarkerControl_independent_marker_orientation;
    interactiveMarkerControl_description;
    }

let json_to_interactiveMarker_opt json = 
    jreq json "interactiveMarker_pose" Geometry_msgs_of_json.json_to_pose_opt @@ fun interactiveMarker_pose ->
    jreq json "interactiveMarker_name" json_to_string_opt @@ fun interactiveMarker_name ->
    jreq json "interactiveMarker_description" json_to_string_opt @@ fun interactiveMarker_description ->
    jreq json "interactiveMarker_scale" json_to_float32_opt @@ fun interactiveMarker_scale ->
    jreq json "interactiveMarker_menu_entries" (jlist json_to_menuEntry_opt) @@ fun interactiveMarker_menu_entries ->
    jreq json "interactiveMarker_controls" (jlist json_to_interactiveMarkerControl_opt) @@ fun interactiveMarker_controls ->
    Some {
    interactiveMarker_pose;
    interactiveMarker_name;
    interactiveMarker_description;
    interactiveMarker_scale;
    interactiveMarker_menu_entries;
    interactiveMarker_controls;
    }

let json_to_interactiveMarkerInit_opt json = 
    jreq json "interactiveMarkerInit_server_id" json_to_string_opt @@ fun interactiveMarkerInit_server_id ->
    jreq json "interactiveMarkerInit_seq_num" json_to_uint64_opt @@ fun interactiveMarkerInit_seq_num ->
    jreq json "interactiveMarkerInit_markers" (jlist json_to_interactiveMarker_opt) @@ fun interactiveMarkerInit_markers ->
    Some {
    interactiveMarkerInit_server_id;
    interactiveMarkerInit_seq_num;
    interactiveMarkerInit_markers;
    }

let json_to_interactiveMarkerUpdate_opt json = 
    jreq json "interactiveMarkerUpdate_server_id" json_to_string_opt @@ fun interactiveMarkerUpdate_server_id ->
    jreq json "interactiveMarkerUpdate_seq_num" json_to_uint64_opt @@ fun interactiveMarkerUpdate_seq_num ->
    jreq json "interactiveMarkerUpdate_ros_type" json_to_uint8_opt @@ fun interactiveMarkerUpdate_ros_type ->
    jreq json "interactiveMarkerUpdate_markers" (jlist json_to_interactiveMarker_opt) @@ fun interactiveMarkerUpdate_markers ->
    jreq json "interactiveMarkerUpdate_poses" (jlist json_to_interactiveMarkerPose_opt) @@ fun interactiveMarkerUpdate_poses ->
    jreq json "interactiveMarkerUpdate_erases" (jlist json_to_string_opt) @@ fun interactiveMarkerUpdate_erases ->
    Some {
    interactiveMarkerUpdate_server_id;
    interactiveMarkerUpdate_seq_num;
    interactiveMarkerUpdate_ros_type;
    interactiveMarkerUpdate_markers;
    interactiveMarkerUpdate_poses;
    interactiveMarkerUpdate_erases;
    }

