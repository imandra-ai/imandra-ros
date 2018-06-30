open Json_utils;;
open Basic_types_to_json;;
open Ros_messages.Dynamic_reconfigure;;

let intParameter_to_json x = [
    ( "intParameter_name" , x.intParameter_name |> string_to_json );
    ( "intParameter_value" , x.intParameter_value |> int32_to_json );
    ] |> assoc_filter_nulls

let strParameter_to_json x = [
    ( "strParameter_name" , x.strParameter_name |> string_to_json );
    ( "strParameter_value" , x.strParameter_value |> string_to_json );
    ] |> assoc_filter_nulls

let doubleParameter_to_json x = [
    ( "doubleParameter_name" , x.doubleParameter_name |> string_to_json );
    ( "doubleParameter_value" , x.doubleParameter_value |> float64_to_json );
    ] |> assoc_filter_nulls

let boolParameter_to_json x = [
    ( "boolParameter_name" , x.boolParameter_name |> string_to_json );
    ( "boolParameter_value" , x.boolParameter_value |> bool_to_json );
    ] |> assoc_filter_nulls

let sensorLevels_to_json x = `Assoc []

let groupState_to_json x = [
    ( "groupState_name" , x.groupState_name |> string_to_json );
    ( "groupState_state" , x.groupState_state |> bool_to_json );
    ( "groupState_id" , x.groupState_id |> int32_to_json );
    ( "groupState_parent" , x.groupState_parent |> int32_to_json );
    ] |> assoc_filter_nulls

let paramDescription_to_json x = [
    ( "paramDescription_name" , x.paramDescription_name |> string_to_json );
    ( "paramDescription_ros_type" , x.paramDescription_ros_type |> string_to_json );
    ( "paramDescription_level" , x.paramDescription_level |> uint32_to_json );
    ( "paramDescription_description" , x.paramDescription_description |> string_to_json );
    ( "paramDescription_edit_method" , x.paramDescription_edit_method |> string_to_json );
    ] |> assoc_filter_nulls

let config_to_json x = [
    ( "config_bools" , x.config_bools |> (mklist boolParameter_to_json) );
    ( "config_ints" , x.config_ints |> (mklist intParameter_to_json) );
    ( "config_strs" , x.config_strs |> (mklist strParameter_to_json) );
    ( "config_doubles" , x.config_doubles |> (mklist doubleParameter_to_json) );
    ( "config_groups" , x.config_groups |> (mklist groupState_to_json) );
    ] |> assoc_filter_nulls

let group_to_json x = [
    ( "group_name" , x.group_name |> string_to_json );
    ( "group_ros_type" , x.group_ros_type |> string_to_json );
    ( "group_parameters" , x.group_parameters |> (mklist paramDescription_to_json) );
    ( "group_parent" , x.group_parent |> int32_to_json );
    ( "group_id" , x.group_id |> int32_to_json );
    ] |> assoc_filter_nulls

let configDescription_to_json x = [
    ( "configDescription_groups" , x.configDescription_groups |> (mklist group_to_json) );
    ( "configDescription_max" , x.configDescription_max |> config_to_json );
    ( "configDescription_min" , x.configDescription_min |> config_to_json );
    ( "configDescription_dflt" , x.configDescription_dflt |> config_to_json );
    ] |> assoc_filter_nulls

