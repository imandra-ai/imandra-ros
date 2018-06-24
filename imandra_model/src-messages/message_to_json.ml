open Message
module J  = Yojson.Basic
module JU = Yojson.Basic.Util 

let assoc_filter_nulls l : J.json =
  `Assoc ( List.filter (function ( _, `Null ) -> false | _ -> true ) l )
;;

let number_to_json x : J.json =  `Int x

let vector3d_to_json x =
  [ ( "x" , x.x |> number_to_json )
  ; ( "y" , x.y |> number_to_json )
  ; ( "z" , x.z |> number_to_json )
  ] |> assoc_filter_nulls

let twist_to_json x =
  let open Geometry_msg in
  [ ( "Linear"  , x.linear  |> vector3d_to_json )
  ; ( "Angular" , x.angular |> vector3d_to_json )
  ] |> assoc_filter_nulls
