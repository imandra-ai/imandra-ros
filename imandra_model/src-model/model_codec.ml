open Ros_messages_pp;;
module J  = Yojson.Basic
module JU = Yojson.Basic.Util 


let json_to_incoming_opt json =
  let data =  JU.member "data" json in
  if data == `Null then None else
  match JU.member "tag" json |> JU.to_string_option with
  | Some "laser_scan" -> begin
    match Sensor_msgs_of_json.json_to_laserScan_opt data with 
    | Some data -> Some ( Ros_model.Sensor data ) | None -> None
  end
  | Some "clock" -> begin
    match Rosgraph_msgs_of_json.json_to_clock_opt data with 
    | Some data -> Some ( Ros_model.Clock data ) | None -> None
  end
  | _ -> None


let outgoing_to_json x =
  match x with
  | Ros_model.Twist data -> `Assoc 
  [ ( "data" , data |> Geometry_msgs_to_json.twist_to_json )
  ; ( "tag"  , `String "twist"    )
  ]
  
