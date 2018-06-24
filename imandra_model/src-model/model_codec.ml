module J  = Yojson.Basic
module JU = Yojson.Basic.Util 


let json_to_incoming_opt json =
  let open Json_to_message in
  let data =  JU.member "data" json in
  if data == `Null then None else
  match JU.member "tag" json |> JU.to_string_option with
  | Some "laser_scan" -> begin
    match json_to_laser_scan_opt data with 
    | Some data -> Some ( Ros_model.Sensor data ) | None -> None
  end
  | Some "clock" -> begin
    match json_to_clock_opt data with 
    | Some data -> Some ( Ros_model.Clock data ) | None -> None
  end
  | _ -> None


let outgoing_to_json x =
  let open Message_to_json in
  match x with
  | Ros_model.Twist data -> `Assoc 
  [ ( "data" , data |> twist_to_json )
  ; ( "tag"  , `String "twist"    )
  ]
  
