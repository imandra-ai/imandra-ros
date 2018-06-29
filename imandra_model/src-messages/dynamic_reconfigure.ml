open Basic_types;;

type intParameter = {
   name : string ;
   value : int32 ;
}

type strParameter = {
   name : string ;
   value : string ;
}

type doubleParameter = {
   name : string ;
   value : float64 ;
}

type boolParameter = {
   name : string ;
   value : bool ;
}

type sensorLevels = ()

type groupState = {
   name : string ;
   state : bool ;
   id : int32 ;
   parent : int32 ;
}

type paramDescription = {
   name : string ;
   ros_type : string ;
   level : uint32 ;
   description : string ;
   edit_method : string ;
}

type config = {
   bools : boolParameter list ;
   ints : intParameter list ;
   strs : strParameter list ;
   doubles : doubleParameter list ;
   groups : groupState list ;
}

type group = {
   name : string ;
   ros_type : string ;
   parameters : paramDescription list ;
   parent : int32 ;
   id : int32 ;
}

type configDescription = {
   groups : group list ;
   max : config ;
   min : config ;
   dflt : config ;
}

