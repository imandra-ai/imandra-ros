module J  = Yojson.Basic
module JU = Yojson.Basic.Util 
open Json_utils;;
open Ros_messages.Basic_types;;


let byte_to_json    x : J.json = `Int x   
let int8_to_json    x : J.json = `Int x   
let int16_to_json   x : J.json = `Int x   
let int32_to_json   x : J.json = `Int x   
let int64_to_json   x : J.json = `Int x   
let uint8_to_json   x : J.json = `Int x   
let uint16_to_json  x : J.json = `Int x   
let uint32_to_json  x : J.json = `Int x   
let uint64_to_json  x : J.json = `Int x   
let float32_to_json x : J.json = `Int x   
let float64_to_json x : J.json = `Int x   

let string_to_json  x : J.json = `String x  
let bool_to_json    x : J.json = `Bool x  

let char_to_json (x : char) : J.json = 
  `String ( String.make 1 x )

let time_to_json ( x : time ) : J.json =
  [ ( "seconds"     , `Int x.seconds     ) 
  ; ( "nanoseconds" , `Int x.nanoseconds ) 
  ] |> assoc_filter_nulls

let duration_to_json ( x : duration ) : J.json =   
  [ ( "seconds"     , `Int x.seconds     ) 
  ; ( "nanoseconds" , `Int x.nanoseconds ) 
  ] |> assoc_filter_nulls
