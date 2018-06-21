open Ros_model
module J  = Yojson.Basic
module JU = Yojson.Basic.Util 

let jreq json key parser f =
  let v = JU.member key json in
  if v == `Null then None else
  match parser v with
  | Some v -> f v
  | None -> None


let jlist parser ( json : J.json) = 
  let rec scan = function
    | Some x :: tl ->
      ( match scan tl with None -> None | Some tl -> Some ( x :: tl ) )
    | None :: tl -> None
    | [] -> Some []
    in
  match json with
  | `List lst -> lst |> List.map parser |> scan
  | _ -> None

let json_to_number_opt = JU.to_int_option

let json_to_time_opt json =
  jreq json "Seconds"      json_to_number_opt @@ fun seconds      -> 
  jreq json "Milliseconds" json_to_number_opt @@ fun milliseconds -> 
  Some { seconds ; milliseconds }

let json_to_vector3d_opt json = 
  jreq json "x" json_to_number_opt @@ fun x -> 
  jreq json "y" json_to_number_opt @@ fun y -> 
  jreq json "z" json_to_number_opt @@ fun z -> 
  Some { x ; y ; z }

let json_to_clock_opt json = 
  let open Rosgraph_msgs in
  jreq json "Clock" json_to_time_opt @@ fun clock ->
  Some { clock }

let json_to_twist_opt json =
  let open Geometry_msg in
  jreq json "Linear"   json_to_vector3d_opt @@ fun linear  ->
  jreq json "Angular"  json_to_vector3d_opt @@ fun angular ->
  Some { linear ; angular }

let json_to_laser_scan_opt json = 
  let open Sensor_msgs in
  jreq json "Angle_min"       json_to_number_opt @@ fun angle_min       ->
  jreq json "Angle_max"       json_to_number_opt @@ fun angle_max       ->
  jreq json "Angle_increment" json_to_number_opt @@ fun angle_increment ->
  jreq json "Time_increment"  json_to_number_opt @@ fun time_increment  ->
  jreq json "Scan_time"       json_to_number_opt @@ fun scan_time       ->
  jreq json "Range_min"       json_to_number_opt @@ fun range_min       ->
  jreq json "Range_max"       json_to_number_opt @@ fun range_max       ->
  jreq json "Ranges"          ( jlist json_to_number_opt ) @@ fun ranges      ->
  jreq json "Intensities"     ( jlist json_to_number_opt ) @@ fun intensities ->
  Some
  { angle_min        
  ; angle_max        
  ; angle_increment  
  ; time_increment   
  ; scan_time        
  ; range_min        
  ; range_max        
  ; ranges           
  ; intensities      
  }

let json_to_incoming_opt json =
  let module JU = Yojson.Basic.Util in 
  let data =  JU.member "data" json in
  if data == `Null then None else
  match JU.member "tag" json |> JU.to_string_option with
  | Some "laser_scan" -> begin
    match json_to_laser_scan_opt data with 
    | Some data -> Some ( Sensor data ) | None -> None
  end
  | Some "clock" -> begin
    match json_to_clock_opt data with 
    | Some data -> Some ( Clock data ) | None -> None
  end
  | _ -> None


