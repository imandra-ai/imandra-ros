open Json_utils;;
open Basic_types_of_json;;
open Ros_messages.Dynamic_reconfigure;;

let json_to_intParameter_opt json = 
    jreq json "intParameter_name" json_to_string_opt @@ fun intParameter_name ->
    jreq json "intParameter_value" json_to_int32_opt @@ fun intParameter_value ->
    Some {
    intParameter_name;
    intParameter_value;
    }

let json_to_strParameter_opt json = 
    jreq json "strParameter_name" json_to_string_opt @@ fun strParameter_name ->
    jreq json "strParameter_value" json_to_string_opt @@ fun strParameter_value ->
    Some {
    strParameter_name;
    strParameter_value;
    }

let json_to_doubleParameter_opt json = 
    jreq json "doubleParameter_name" json_to_string_opt @@ fun doubleParameter_name ->
    jreq json "doubleParameter_value" json_to_float64_opt @@ fun doubleParameter_value ->
    Some {
    doubleParameter_name;
    doubleParameter_value;
    }

let json_to_boolParameter_opt json = 
    jreq json "boolParameter_name" json_to_string_opt @@ fun boolParameter_name ->
    jreq json "boolParameter_value" json_to_bool_opt @@ fun boolParameter_value ->
    Some {
    boolParameter_name;
    boolParameter_value;
    }

let json_to_sensorLevels_opt json : sensorLevels option = Some ()

let json_to_groupState_opt json = 
    jreq json "groupState_name" json_to_string_opt @@ fun groupState_name ->
    jreq json "groupState_state" json_to_bool_opt @@ fun groupState_state ->
    jreq json "groupState_id" json_to_int32_opt @@ fun groupState_id ->
    jreq json "groupState_parent" json_to_int32_opt @@ fun groupState_parent ->
    Some {
    groupState_name;
    groupState_state;
    groupState_id;
    groupState_parent;
    }

let json_to_paramDescription_opt json = 
    jreq json "paramDescription_name" json_to_string_opt @@ fun paramDescription_name ->
    jreq json "paramDescription_ros_type" json_to_string_opt @@ fun paramDescription_ros_type ->
    jreq json "paramDescription_level" json_to_uint32_opt @@ fun paramDescription_level ->
    jreq json "paramDescription_description" json_to_string_opt @@ fun paramDescription_description ->
    jreq json "paramDescription_edit_method" json_to_string_opt @@ fun paramDescription_edit_method ->
    Some {
    paramDescription_name;
    paramDescription_ros_type;
    paramDescription_level;
    paramDescription_description;
    paramDescription_edit_method;
    }

let json_to_config_opt json = 
    jreq json "config_bools" (jlist json_to_boolParameter_opt) @@ fun config_bools ->
    jreq json "config_ints" (jlist json_to_intParameter_opt) @@ fun config_ints ->
    jreq json "config_strs" (jlist json_to_strParameter_opt) @@ fun config_strs ->
    jreq json "config_doubles" (jlist json_to_doubleParameter_opt) @@ fun config_doubles ->
    jreq json "config_groups" (jlist json_to_groupState_opt) @@ fun config_groups ->
    Some {
    config_bools;
    config_ints;
    config_strs;
    config_doubles;
    config_groups;
    }

let json_to_group_opt json = 
    jreq json "group_name" json_to_string_opt @@ fun group_name ->
    jreq json "group_ros_type" json_to_string_opt @@ fun group_ros_type ->
    jreq json "group_parameters" (jlist json_to_paramDescription_opt) @@ fun group_parameters ->
    jreq json "group_parent" json_to_int32_opt @@ fun group_parent ->
    jreq json "group_id" json_to_int32_opt @@ fun group_id ->
    Some {
    group_name;
    group_ros_type;
    group_parameters;
    group_parent;
    group_id;
    }

let json_to_configDescription_opt json = 
    jreq json "configDescription_groups" (jlist json_to_group_opt) @@ fun configDescription_groups ->
    jreq json "configDescription_max" json_to_config_opt @@ fun configDescription_max ->
    jreq json "configDescription_min" json_to_config_opt @@ fun configDescription_min ->
    jreq json "configDescription_dflt" json_to_config_opt @@ fun configDescription_dflt ->
    Some {
    configDescription_groups;
    configDescription_max;
    configDescription_min;
    configDescription_dflt;
    }

