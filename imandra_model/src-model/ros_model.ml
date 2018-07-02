open Ros_messages;; 
open Imandra_prelude;;

type incoming_msg = 
  | Clock  of Rosgraph_msgs.clock
  | Sensor of Sensor_msgs.laserScan

type outgoing_msg =
  | Twist of Geometry_msgs.twist

type state =
  { min_range : Basic_types.float64 option
  ; incoming  : incoming_msg option
  ; outgoing  : outgoing_msg option 
  }

let init_state = 
  { min_range = None
  ; incoming  = None
  ; outgoing  = None 
  }

let get_min_range msg : Basic_types.float64 = 
  let max = msg.Sensor_msgs.laserScan_range_max in
  let min = List.fold_left (fun a b -> if a < b then a else b) max in
  min msg.Sensor_msgs.laserScan_ranges
  
let make_twist_message v omega=
  let open Geometry_msgs in
  let mkvector x y z = { vector3_x = x; vector3_y = y; vector3_z = z } in 
  Twist { twist_linear  = mkvector v 0 0
        ; twist_angular = mkvector 0 0 omega 
        } 

let one_step state =
  match state.incoming with None -> state | Some in_msg ->
  let state = { state with incoming = None; outgoing = None } in
  match in_msg with 
  | Sensor laserScan -> 
    { state with min_range = Some (get_min_range laserScan) }
  | Clock  _ -> begin
    match state.min_range with None -> state | Some min_range ->
    if min_range < 50000
    then { state with outgoing = Some (make_twist_message 0 10000) } 
    else { state with outgoing = Some (make_twist_message 10000 0) }
  end
