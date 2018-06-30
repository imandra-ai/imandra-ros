open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Gazebo_msgs;;

let json_to_modelState_opt json = 
    jreq json "modelState_model_name" json_to_string_opt @@ fun modelState_model_name ->
    jreq json "modelState_pose" Geometry_msgs_of_json.json_to_pose_opt @@ fun modelState_pose ->
    jreq json "modelState_twist" Geometry_msgs_of_json.json_to_twist_opt @@ fun modelState_twist ->
    jreq json "modelState_reference_frame" json_to_string_opt @@ fun modelState_reference_frame ->
    Some {
    modelState_model_name;
    modelState_pose;
    modelState_twist;
    modelState_reference_frame;
    }

let json_to_oDEJointProperties_opt json = 
    jreq json "oDEJointProperties_damping" (jlist json_to_float64_opt) @@ fun oDEJointProperties_damping ->
    jreq json "oDEJointProperties_hiStop" (jlist json_to_float64_opt) @@ fun oDEJointProperties_hiStop ->
    jreq json "oDEJointProperties_loStop" (jlist json_to_float64_opt) @@ fun oDEJointProperties_loStop ->
    jreq json "oDEJointProperties_erp" (jlist json_to_float64_opt) @@ fun oDEJointProperties_erp ->
    jreq json "oDEJointProperties_cfm" (jlist json_to_float64_opt) @@ fun oDEJointProperties_cfm ->
    jreq json "oDEJointProperties_stop_erp" (jlist json_to_float64_opt) @@ fun oDEJointProperties_stop_erp ->
    jreq json "oDEJointProperties_stop_cfm" (jlist json_to_float64_opt) @@ fun oDEJointProperties_stop_cfm ->
    jreq json "oDEJointProperties_fudge_factor" (jlist json_to_float64_opt) @@ fun oDEJointProperties_fudge_factor ->
    jreq json "oDEJointProperties_fmax" (jlist json_to_float64_opt) @@ fun oDEJointProperties_fmax ->
    jreq json "oDEJointProperties_vel" (jlist json_to_float64_opt) @@ fun oDEJointProperties_vel ->
    Some {
    oDEJointProperties_damping;
    oDEJointProperties_hiStop;
    oDEJointProperties_loStop;
    oDEJointProperties_erp;
    oDEJointProperties_cfm;
    oDEJointProperties_stop_erp;
    oDEJointProperties_stop_cfm;
    oDEJointProperties_fudge_factor;
    oDEJointProperties_fmax;
    oDEJointProperties_vel;
    }

let json_to_modelStates_opt json = 
    jreq json "modelStates_name" (jlist json_to_string_opt) @@ fun modelStates_name ->
    jreq json "modelStates_pose" (jlist Geometry_msgs_of_json.json_to_pose_opt) @@ fun modelStates_pose ->
    jreq json "modelStates_twist" (jlist Geometry_msgs_of_json.json_to_twist_opt) @@ fun modelStates_twist ->
    Some {
    modelStates_name;
    modelStates_pose;
    modelStates_twist;
    }

let json_to_linkStates_opt json = 
    jreq json "linkStates_name" (jlist json_to_string_opt) @@ fun linkStates_name ->
    jreq json "linkStates_pose" (jlist Geometry_msgs_of_json.json_to_pose_opt) @@ fun linkStates_pose ->
    jreq json "linkStates_twist" (jlist Geometry_msgs_of_json.json_to_twist_opt) @@ fun linkStates_twist ->
    Some {
    linkStates_name;
    linkStates_pose;
    linkStates_twist;
    }

let json_to_linkState_opt json = 
    jreq json "linkState_link_name" json_to_string_opt @@ fun linkState_link_name ->
    jreq json "linkState_pose" Geometry_msgs_of_json.json_to_pose_opt @@ fun linkState_pose ->
    jreq json "linkState_twist" Geometry_msgs_of_json.json_to_twist_opt @@ fun linkState_twist ->
    jreq json "linkState_reference_frame" json_to_string_opt @@ fun linkState_reference_frame ->
    Some {
    linkState_link_name;
    linkState_pose;
    linkState_twist;
    linkState_reference_frame;
    }

let json_to_oDEPhysics_opt json = 
    jreq json "oDEPhysics_auto_disable_bodies" json_to_bool_opt @@ fun oDEPhysics_auto_disable_bodies ->
    jreq json "oDEPhysics_sor_pgs_precon_iters" json_to_uint32_opt @@ fun oDEPhysics_sor_pgs_precon_iters ->
    jreq json "oDEPhysics_sor_pgs_iters" json_to_uint32_opt @@ fun oDEPhysics_sor_pgs_iters ->
    jreq json "oDEPhysics_sor_pgs_w" json_to_float64_opt @@ fun oDEPhysics_sor_pgs_w ->
    jreq json "oDEPhysics_sor_pgs_rms_error_tol" json_to_float64_opt @@ fun oDEPhysics_sor_pgs_rms_error_tol ->
    jreq json "oDEPhysics_contact_surface_layer" json_to_float64_opt @@ fun oDEPhysics_contact_surface_layer ->
    jreq json "oDEPhysics_contact_max_correcting_vel" json_to_float64_opt @@ fun oDEPhysics_contact_max_correcting_vel ->
    jreq json "oDEPhysics_cfm" json_to_float64_opt @@ fun oDEPhysics_cfm ->
    jreq json "oDEPhysics_erp" json_to_float64_opt @@ fun oDEPhysics_erp ->
    jreq json "oDEPhysics_max_contacts" json_to_uint32_opt @@ fun oDEPhysics_max_contacts ->
    Some {
    oDEPhysics_auto_disable_bodies;
    oDEPhysics_sor_pgs_precon_iters;
    oDEPhysics_sor_pgs_iters;
    oDEPhysics_sor_pgs_w;
    oDEPhysics_sor_pgs_rms_error_tol;
    oDEPhysics_contact_surface_layer;
    oDEPhysics_contact_max_correcting_vel;
    oDEPhysics_cfm;
    oDEPhysics_erp;
    oDEPhysics_max_contacts;
    }

let json_to_contactState_opt json = 
    jreq json "info" json_to_string_opt @@ fun info ->
    jreq json "collision1_name" json_to_string_opt @@ fun collision1_name ->
    jreq json "collision2_name" json_to_string_opt @@ fun collision2_name ->
    jreq json "wrenches" (jlist Geometry_msgs_of_json.json_to_wrench_opt) @@ fun wrenches ->
    jreq json "total_wrench" Geometry_msgs_of_json.json_to_wrench_opt @@ fun total_wrench ->
    jreq json "contact_positions" (jlist Geometry_msgs_of_json.json_to_vector3_opt) @@ fun contact_positions ->
    jreq json "contact_normals" (jlist Geometry_msgs_of_json.json_to_vector3_opt) @@ fun contact_normals ->
    jreq json "depths" (jlist json_to_float64_opt) @@ fun depths ->
    Some {
    info;
    collision1_name;
    collision2_name;
    wrenches;
    total_wrench;
    contact_positions;
    contact_normals;
    depths;
    }

let json_to_worldState_opt json = 
    jreq json "worldState_header" Std_msgs_of_json.json_to_header_opt @@ fun worldState_header ->
    jreq json "worldState_name" (jlist json_to_string_opt) @@ fun worldState_name ->
    jreq json "worldState_pose" (jlist Geometry_msgs_of_json.json_to_pose_opt) @@ fun worldState_pose ->
    jreq json "worldState_twist" (jlist Geometry_msgs_of_json.json_to_twist_opt) @@ fun worldState_twist ->
    jreq json "worldState_wrench" (jlist Geometry_msgs_of_json.json_to_wrench_opt) @@ fun worldState_wrench ->
    Some {
    worldState_header;
    worldState_name;
    worldState_pose;
    worldState_twist;
    worldState_wrench;
    }

let json_to_contactsState_opt json = 
    jreq json "contactsState_header" Std_msgs_of_json.json_to_header_opt @@ fun contactsState_header ->
    jreq json "contactsState_states" (jlist json_to_contactState_opt) @@ fun contactsState_states ->
    Some {
    contactsState_header;
    contactsState_states;
    }

