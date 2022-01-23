module D = Decoders_yojson.Basic.Decode
module RD = Ros_messages_json.Decode(D)
module E = Decoders_yojson.Basic.Encode
module RE = Ros_messages_json.Encode(E)


let json_to_incoming_opt json =
  let decoder : Ros_model.incoming_msg D.decoder =
    let open D.Infix in
    let* tag = D.field_opt "tag" D.string in
    match tag with
    | None -> D.fail "Missing tag field" 
    | Some "clock" -> 
      let* d = D.field "data" RD.Rosgraph_msgs.clock in
      D.succeed @@ Ros_model.Clock d
    | Some "laser_scan" -> 
      let* d = D.field "data" RD.Sensor_msgs.laser_scan in
      D.succeed @@ Ros_model.Sensor d
    | Some s -> D.fail @@ "Unknown tag field " ^ s 
    in
  match D.decode_string decoder json with 
  | Error e -> print_endline @@ D.string_of_error e; None
  | Ok x -> Some x
    


let outgoing_to_json x =
  let encoder : Ros_model.outgoing_msg E.encoder = function 
    | Ros_model.Twist d -> E.obj 
      [("tag", E.string "twist"); ("data", RE.Geometry_msgs.twist d)]
    in
  E.encode_string encoder x
  
