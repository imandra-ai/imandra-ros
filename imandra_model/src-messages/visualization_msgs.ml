open Basic_types;;

type interactiveMarkerPose = {
   interactiveMarkerPose_header : Std_msgs.header ;
   interactiveMarkerPose_pose : Geometry_msgs.pose ;
   interactiveMarkerPose_name : string ;
}

type menuEntry = {
   menuEntry_id : uint32 ;
   menuEntry_parent_id : uint32 ;
   menuEntry_title : string ;
   menuEntry_command : string ;
   menuEntry_command_type : uint8 ;
}

type interactiveMarkerFeedback = {
   interactiveMarkerFeedback_header : Std_msgs.header ;
   interactiveMarkerFeedback_client_id : string ;
   interactiveMarkerFeedback_marker_name : string ;
   interactiveMarkerFeedback_control_name : string ;
   interactiveMarkerFeedback_event_type : uint8 ;
   interactiveMarkerFeedback_pose : Geometry_msgs.pose ;
   interactiveMarkerFeedback_menu_entry_id : uint32 ;
   interactiveMarkerFeedback_mouse_point : Geometry_msgs.point ;
   interactiveMarkerFeedback_mouse_point_valid : bool ;
}

type marker = {
   marker_header : Std_msgs.header ;
   marker_ns : string ;
   marker_id : int32 ;
   marker_ros_type : int32 ;
   marker_action : int32 ;
   marker_pose : Geometry_msgs.pose ;
   marker_scale : Geometry_msgs.vector3 ;
   marker_color : Std_msgs.colorRGBA ;
   marker_lifetime : duration ;
   marker_frame_locked : bool ;
   marker_points : Geometry_msgs.point list ;
   marker_colors : Std_msgs.colorRGBA list ;
   marker_text : string ;
   marker_mesh_resource : string ;
   marker_mesh_use_embedded_materials : bool ;
}

type imageMarker = {
   imageMarker_header : Std_msgs.header ;
   imageMarker_ns : string ;
   imageMarker_id : int32 ;
   imageMarker_ros_type : int32 ;
   imageMarker_action : int32 ;
   imageMarker_position : Geometry_msgs.point ;
   imageMarker_scale : float32 ;
   imageMarker_outline_color : Std_msgs.colorRGBA ;
   imageMarker_filled : uint8 ;
   imageMarker_fill_color : Std_msgs.colorRGBA ;
   imageMarker_lifetime : duration ;
   imageMarker_points : Geometry_msgs.point list ;
   imageMarker_outline_colors : Std_msgs.colorRGBA list ;
}

type markerArray = {
   markerArray_markers : marker list ;
}

type interactiveMarkerControl = {
   interactiveMarkerControl_name : string ;
   interactiveMarkerControl_orientation : Geometry_msgs.quaternion ;
   interactiveMarkerControl_orientation_mode : uint8 ;
   interactiveMarkerControl_interaction_mode : uint8 ;
   interactiveMarkerControl_always_visible : bool ;
   interactiveMarkerControl_markers : marker list ;
   interactiveMarkerControl_independent_marker_orientation : bool ;
   interactiveMarkerControl_description : string ;
}

type interactiveMarker = {
   interactiveMarker_header : Std_msgs.header ;
   interactiveMarker_pose : Geometry_msgs.pose ;
   interactiveMarker_name : string ;
   interactiveMarker_description : string ;
   interactiveMarker_scale : float32 ;
   interactiveMarker_menu_entries : menuEntry list ;
   interactiveMarker_controls : interactiveMarkerControl list ;
}

type interactiveMarkerInit = {
   interactiveMarkerInit_server_id : string ;
   interactiveMarkerInit_seq_num : uint64 ;
   interactiveMarkerInit_markers : interactiveMarker list ;
}

type interactiveMarkerUpdate = {
   interactiveMarkerUpdate_server_id : string ;
   interactiveMarkerUpdate_seq_num : uint64 ;
   interactiveMarkerUpdate_ros_type : uint8 ;
   interactiveMarkerUpdate_markers : interactiveMarker list ;
   interactiveMarkerUpdate_poses : interactiveMarkerPose list ;
   interactiveMarkerUpdate_erases : string list ;
}

