open Basic_types;;

type modelState = {
   modelState_model_name : string ;
   modelState_pose : Geometry_msgs.pose ;
   modelState_twist : Geometry_msgs.twist ;
   modelState_reference_frame : string ;
}

type oDEJointProperties = {
   oDEJointProperties_damping : float64 list ;
   oDEJointProperties_hiStop : float64 list ;
   oDEJointProperties_loStop : float64 list ;
   oDEJointProperties_erp : float64 list ;
   oDEJointProperties_cfm : float64 list ;
   oDEJointProperties_stop_erp : float64 list ;
   oDEJointProperties_stop_cfm : float64 list ;
   oDEJointProperties_fudge_factor : float64 list ;
   oDEJointProperties_fmax : float64 list ;
   oDEJointProperties_vel : float64 list ;
}

type modelStates = {
   modelStates_name : string list ;
   modelStates_pose : Geometry_msgs.pose list ;
   modelStates_twist : Geometry_msgs.twist list ;
}

type linkStates = {
   linkStates_name : string list ;
   linkStates_pose : Geometry_msgs.pose list ;
   linkStates_twist : Geometry_msgs.twist list ;
}

type linkState = {
   linkState_link_name : string ;
   linkState_pose : Geometry_msgs.pose ;
   linkState_twist : Geometry_msgs.twist ;
   linkState_reference_frame : string ;
}

type oDEPhysics = {
   oDEPhysics_auto_disable_bodies : bool ;
   oDEPhysics_sor_pgs_precon_iters : uint32 ;
   oDEPhysics_sor_pgs_iters : uint32 ;
   oDEPhysics_sor_pgs_w : float64 ;
   oDEPhysics_sor_pgs_rms_error_tol : float64 ;
   oDEPhysics_contact_surface_layer : float64 ;
   oDEPhysics_contact_max_correcting_vel : float64 ;
   oDEPhysics_cfm : float64 ;
   oDEPhysics_erp : float64 ;
   oDEPhysics_max_contacts : uint32 ;
}

type contactState = {
   info : string ;
   collision1_name : string ;
   collision2_name : string ;
   wrenches : Geometry_msgs.wrench list ;
   total_wrench : Geometry_msgs.wrench ;
   contact_positions : Geometry_msgs.vector3 list ;
   contact_normals : Geometry_msgs.vector3 list ;
   depths : float64 list ;
}

type worldState = {
   worldState_header : Std_msgs.header ;
   worldState_name : string list ;
   worldState_pose : Geometry_msgs.pose list ;
   worldState_twist : Geometry_msgs.twist list ;
   worldState_wrench : Geometry_msgs.wrench list ;
}

type contactsState = {
   contactsState_header : Std_msgs.header ;
   contactsState_states : contactState list ;
}

