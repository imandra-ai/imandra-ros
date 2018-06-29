open Basic_types;;

type interactiveMarkerPose = {
   pose : Geometry_msgs.pose ;
   name : string ;
}

type menuEntry = {
   id : uint32 ;
   parent_id : uint32 ;
   title : string ;
   command : string ;
   command_type : uint8 ;
}

type interactiveMarkerFeedback = {
   client_id : string ;
   marker_name : string ;
   control_name : string ;
   event_type : uint8 ;
   pose : Geometry_msgs.pose ;
   menu_entry_id : uint32 ;
   mouse_point : Geometry_msgs.point ;
   mouse_point_valid : bool ;
}

type marker = {
   ns : string ;
   id : int32 ;
   ros_type : int32 ;
   action : int32 ;
   pose : Geometry_msgs.pose ;
   scale : Geometry_msgs.vector3 ;
   color : Std_msgs.colorRGBA ;
   lifetime : duration ;
   frame_locked : bool ;
   points : Geometry_msgs.point list ;
   colors : Std_msgs.colorRGBA list ;
   text : string ;
   mesh_resource : string ;
   mesh_use_embedded_materials : bool ;
}

type imageMarker = {
   ns : string ;
   id : int32 ;
   ros_type : int32 ;
   action : int32 ;
   position : Geometry_msgs.point ;
   scale : float32 ;
   outline_color : Std_msgs.colorRGBA ;
   filled : uint8 ;
   fill_color : Std_msgs.colorRGBA ;
   lifetime : duration ;
   points : Geometry_msgs.point list ;
   outline_colors : Std_msgs.colorRGBA list ;
}

type markerArray = {
   markers : marker list ;
}

type interactiveMarkerControl = {
   name : string ;
   orientation : Geometry_msgs.quaternion ;
   orientation_mode : uint8 ;
   interaction_mode : uint8 ;
   always_visible : bool ;
   markers : marker list ;
   independent_marker_orientation : bool ;
   description : string ;
}

type interactiveMarker = {
   pose : Geometry_msgs.pose ;
   name : string ;
   description : string ;
   scale : float32 ;
   menu_entries : menuEntry list ;
   controls : interactiveMarkerControl list ;
}

type interactiveMarkerInit = {
   server_id : string ;
   seq_num : uint64 ;
   markers : interactiveMarker list ;
}

type interactiveMarkerUpdate = {
   server_id : string ;
   seq_num : uint64 ;
   ros_type : uint8 ;
   markers : interactiveMarker list ;
   poses : interactiveMarkerPose list ;
   erases : string list ;
}

