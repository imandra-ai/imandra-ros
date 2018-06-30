module J  = Yojson.Basic
module JU = Yojson.Basic.Util 
open Json_utils;;
open Ros_messages.Basic_types;;


let json_to_byte_opt    = JU.to_int_option  
let json_to_int8_opt    = JU.to_int_option  
let json_to_int16_opt   = JU.to_int_option  
let json_to_int32_opt   = JU.to_int_option  
let json_to_int64_opt   = JU.to_int_option  
let json_to_uint8_opt   = JU.to_int_option  
let json_to_uint16_opt  = JU.to_int_option  
let json_to_uint32_opt  = JU.to_int_option  
let json_to_uint64_opt  = JU.to_int_option  
let json_to_float32_opt = JU.to_int_option  
let json_to_float64_opt = JU.to_int_option  

let json_to_string_opt  = JU.to_string_option  
let json_to_bool_opt    = JU.to_bool_option  

let json_to_char_opt json = 
  match JU.to_string_option json with None -> None
  | Some str -> Some (String.get str 0 |> Char.code)

let json_to_time_opt json =
  jreq json "seconds"     JU.to_int_option @@ fun seconds     -> 
  jreq json "nanoseconds" JU.to_int_option @@ fun nanoseconds -> 
  Some { seconds ; nanoseconds }

let json_to_duration_opt (json : J.json) : duration option =
  jreq json "seconds"     JU.to_int_option @@ fun seconds     -> 
  jreq json "nanoseconds" JU.to_int_option @@ fun nanoseconds -> 
  Some { seconds ; nanoseconds }


