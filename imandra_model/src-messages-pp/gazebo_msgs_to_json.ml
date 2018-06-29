open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Gazebo_msgs;;

let modelState_to_json x = [
    ( "modelState_model_name" , x.modelState_model_name |> string_to_json );
    ( "modelState_pose" , x.modelState_pose |> Geometry_msgs_to_json.pose_to_json );
    ( "modelState_twist" , x.modelState_twist |> Geometry_msgs_to_json.twist_to_json );
    ( "modelState_reference_frame" , x.modelState_reference_frame |> string_to_json );
    ] |> assoc_filter_nulls

let oDEJointProperties_to_json x = [
    ( "oDEJointProperties_damping" , x.oDEJointProperties_damping |> (mklist float64_to_json) );
    ( "oDEJointProperties_hiStop" , x.oDEJointProperties_hiStop |> (mklist float64_to_json) );
    ( "oDEJointProperties_loStop" , x.oDEJointProperties_loStop |> (mklist float64_to_json) );
    ( "oDEJointProperties_erp" , x.oDEJointProperties_erp |> (mklist float64_to_json) );
    ( "oDEJointProperties_cfm" , x.oDEJointProperties_cfm |> (mklist float64_to_json) );
    ( "oDEJointProperties_stop_erp" , x.oDEJointProperties_stop_erp |> (mklist float64_to_json) );
    ( "oDEJointProperties_stop_cfm" , x.oDEJointProperties_stop_cfm |> (mklist float64_to_json) );
    ( "oDEJointProperties_fudge_factor" , x.oDEJointProperties_fudge_factor |> (mklist float64_to_json) );
    ( "oDEJointProperties_fmax" , x.oDEJointProperties_fmax |> (mklist float64_to_json) );
    ( "oDEJointProperties_vel" , x.oDEJointProperties_vel |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let modelStates_to_json x = [
    ( "modelStates_name" , x.modelStates_name |> (mklist string_to_json) );
    ( "modelStates_pose" , x.modelStates_pose |> (mklist Geometry_msgs_to_json.pose_to_json) );
    ( "modelStates_twist" , x.modelStates_twist |> (mklist Geometry_msgs_to_json.twist_to_json) );
    ] |> assoc_filter_nulls

let linkStates_to_json x = [
    ( "linkStates_name" , x.linkStates_name |> (mklist string_to_json) );
    ( "linkStates_pose" , x.linkStates_pose |> (mklist Geometry_msgs_to_json.pose_to_json) );
    ( "linkStates_twist" , x.linkStates_twist |> (mklist Geometry_msgs_to_json.twist_to_json) );
    ] |> assoc_filter_nulls

let linkState_to_json x = [
    ( "linkState_link_name" , x.linkState_link_name |> string_to_json );
    ( "linkState_pose" , x.linkState_pose |> Geometry_msgs_to_json.pose_to_json );
    ( "linkState_twist" , x.linkState_twist |> Geometry_msgs_to_json.twist_to_json );
    ( "linkState_reference_frame" , x.linkState_reference_frame |> string_to_json );
    ] |> assoc_filter_nulls

let oDEPhysics_to_json x = [
    ( "oDEPhysics_auto_disable_bodies" , x.oDEPhysics_auto_disable_bodies |> bool_to_json );
    ( "oDEPhysics_sor_pgs_precon_iters" , x.oDEPhysics_sor_pgs_precon_iters |> uint32_to_json );
    ( "oDEPhysics_sor_pgs_iters" , x.oDEPhysics_sor_pgs_iters |> uint32_to_json );
    ( "oDEPhysics_sor_pgs_w" , x.oDEPhysics_sor_pgs_w |> float64_to_json );
    ( "oDEPhysics_sor_pgs_rms_error_tol" , x.oDEPhysics_sor_pgs_rms_error_tol |> float64_to_json );
    ( "oDEPhysics_contact_surface_layer" , x.oDEPhysics_contact_surface_layer |> float64_to_json );
    ( "oDEPhysics_contact_max_correcting_vel" , x.oDEPhysics_contact_max_correcting_vel |> float64_to_json );
    ( "oDEPhysics_cfm" , x.oDEPhysics_cfm |> float64_to_json );
    ( "oDEPhysics_erp" , x.oDEPhysics_erp |> float64_to_json );
    ( "oDEPhysics_max_contacts" , x.oDEPhysics_max_contacts |> uint32_to_json );
    ] |> assoc_filter_nulls

let contactState_to_json x = [
    ( "info" , x.info |> string_to_json );
    ( "collision1_name" , x.collision1_name |> string_to_json );
    ( "collision2_name" , x.collision2_name |> string_to_json );
    ( "wrenches" , x.wrenches |> (mklist Geometry_msgs_to_json.wrench_to_json) );
    ( "total_wrench" , x.total_wrench |> Geometry_msgs_to_json.wrench_to_json );
    ( "contact_positions" , x.contact_positions |> (mklist Geometry_msgs_to_json.vector3_to_json) );
    ( "contact_normals" , x.contact_normals |> (mklist Geometry_msgs_to_json.vector3_to_json) );
    ( "depths" , x.depths |> (mklist float64_to_json) );
    ] |> assoc_filter_nulls

let worldState_to_json x = [
    ( "worldState_name" , x.worldState_name |> (mklist string_to_json) );
    ( "worldState_pose" , x.worldState_pose |> (mklist Geometry_msgs_to_json.pose_to_json) );
    ( "worldState_twist" , x.worldState_twist |> (mklist Geometry_msgs_to_json.twist_to_json) );
    ( "worldState_wrench" , x.worldState_wrench |> (mklist Geometry_msgs_to_json.wrench_to_json) );
    ] |> assoc_filter_nulls

let contactsState_to_json x = [
    ( "states" , x.states |> (mklist contactState_to_json) );
    ] |> assoc_filter_nulls

