open Basic_types;;

type modelState = {
   model_name : string ;
   pose : Geometry_msgs.pose ;
   twist : Geometry_msgs.twist ;
   reference_frame : string ;
}

type oDEJointProperties = {
   damping : float64 list ;
   hiStop : float64 list ;
   loStop : float64 list ;
   erp : float64 list ;
   cfm : float64 list ;
   stop_erp : float64 list ;
   stop_cfm : float64 list ;
   fudge_factor : float64 list ;
   fmax : float64 list ;
   vel : float64 list ;
}

type modelStates = {
   name : string list ;
   pose : Geometry_msgs.pose list ;
   twist : Geometry_msgs.twist list ;
}

type linkStates = {
   name : string list ;
   pose : Geometry_msgs.pose list ;
   twist : Geometry_msgs.twist list ;
}

type linkState = {
   link_name : string ;
   pose : Geometry_msgs.pose ;
   twist : Geometry_msgs.twist ;
   reference_frame : string ;
}

type oDEPhysics = {
   auto_disable_bodies : bool ;
   sor_pgs_precon_iters : uint32 ;
   sor_pgs_iters : uint32 ;
   sor_pgs_w : float64 ;
   sor_pgs_rms_error_tol : float64 ;
   contact_surface_layer : float64 ;
   contact_max_correcting_vel : float64 ;
   cfm : float64 ;
   erp : float64 ;
   max_contacts : uint32 ;
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
   name : string list ;
   pose : Geometry_msgs.pose list ;
   twist : Geometry_msgs.twist list ;
   wrench : Geometry_msgs.wrench list ;
}

type contactsState = {
   states : contactState list ;
}

