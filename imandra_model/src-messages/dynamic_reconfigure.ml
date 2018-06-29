open Basic_types;;

type intParameter = {
   intParameter_name : string ;
   intParameter_value : int32 ;
}

type strParameter = {
   strParameter_name : string ;
   strParameter_value : string ;
}

type doubleParameter = {
   doubleParameter_name : string ;
   doubleParameter_value : float64 ;
}

type boolParameter = {
   boolParameter_name : string ;
   boolParameter_value : bool ;
}

type sensorLevels = ()

type groupState = {
   groupState_name : string ;
   groupState_state : bool ;
   groupState_id : int32 ;
   groupState_parent : int32 ;
}

type paramDescription = {
   paramDescription_name : string ;
   paramDescription_ros_type : string ;
   paramDescription_level : uint32 ;
   paramDescription_description : string ;
   paramDescription_edit_method : string ;
}

type config = {
   config_bools : boolParameter list ;
   config_ints : intParameter list ;
   config_strs : strParameter list ;
   config_doubles : doubleParameter list ;
   config_groups : groupState list ;
}

type group = {
   group_name : string ;
   group_ros_type : string ;
   group_parameters : paramDescription list ;
   group_parent : int32 ;
   group_id : int32 ;
}

type configDescription = {
   configDescription_groups : group list ;
   configDescription_max : config ;
   configDescription_min : config ;
   configDescription_dflt : config ;
}

