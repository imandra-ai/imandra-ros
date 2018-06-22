type number = int
type time = 
  { seconds : int
  ; milliseconds : int
  }

type vector3d = 
  { x : number
  ; y : number
  ; z : number }

let mkvector x y z = { x ; y ; z }

module Geometry_msg = struct
  type twist = 
    { linear  : vector3d
    ; angular : vector3d
    }
  let default_twist =
    { linear  = { x = 0 ; y = 0 ; z = 0 }
    ; angular = { x = 0 ; y = 0 ; z = 0 }
    }
end

module Sensor_msgs = struct
  type laser_scan = 
    { angle_min        : number
    ; angle_max        : number
    ; angle_increment  : number
    ; time_increment   : number
    ; scan_time        : number
    ; range_min        : number
    ; range_max        : number
    ; ranges           : number list
    ; intensities      : number list
    }
end

module Rosgraph_msgs = struct 
  type severity =
    | DEBUG
    | INFO
    | WARN
    | ERROR
    | FATAL 
  type clock = { clock : time }
  type log = 
  { level : severity
  ; name  : string 
  ; msg   : string  
  ; file  : string 
  ; func  : string
  ; line  : int 
  ; topics : string list  
  }
end


type incoming =
  | Clock  of Rosgraph_msgs.clock
  | Sensor of Sensor_msgs.laser_scan

type outgoing =
  | Twist of Geometry_msg.twist
  
type mode =
  | Stopped
  | Turning
  | Driving
  | Error

type state = 
  { mode     : mode 
  ; incoming : incoming option 
  ; outgoing : outgoing option
  }

let init_state = 
  { mode = Stopped
  ; incoming = None
  ; outgoing = None
  }

let valid_incoming incoming =
  match incoming with
    | Sensor smsg -> List.length smsg.Sensor_msgs.ranges = 5
    | _ -> true

let drive state =
  { state with 
    mode = Driving 
  ; outgoing = Some ( Twist Geometry_msg.
    { linear  = mkvector 100 0 0
    ; angular = mkvector 0 0 0 
    } ) 
  }

let stop state =
  { state with 
    mode = Stopped 
  ; outgoing = Some ( Twist Geometry_msg.
    { linear  = mkvector 0 0 0
    ; angular = mkvector 0 0 0 
    } ) 
  }

let turn state =
  { state with 
    mode = Turning 
  ; outgoing = Some ( Twist Geometry_msg.
    { linear  = mkvector 0 0 0
    ; angular = mkvector 0 0 100 
    } ) 
  }
  
let process_stopped ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      if List.nth l.Sensor_msgs.ranges 2 < 1000 
      then turn state 
      else drive state
    end

let process_driving ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      if List.nth l.Sensor_msgs.ranges 2 < 1000 
      then stop state 
      else drive state
    end

let process_turning ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      if List.nth l.Sensor_msgs.ranges 2 > 1000 
      then stop state 
      else state
    end

let one_step (state : state) =
  let state = { state with outgoing = None } in
  if state.mode = Error then state else
  match state.incoming with None -> state | Some msg ->
  if not (valid_incoming msg) then { state with mode = Error } else 
  match state.mode with
    | Stopped -> process_stopped ( state , msg )
    | Driving -> process_driving ( state , msg )
    | Turning -> process_turning ( state , msg )  
    | _ -> state

