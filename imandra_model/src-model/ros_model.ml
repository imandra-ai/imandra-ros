open Message

let mkvector x y z = { x ; y ; z }

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

let lnth l i = List.nth i l

let process_stopped ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      match lnth l.Sensor_msgs.ranges 2 with
      | Some n when n < 1000 -> turn state 
      | _ -> drive state
    end

let process_driving ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      match lnth l.Sensor_msgs.ranges 2 with
      | Some n when n < 1000 -> turn state 
      | _ -> drive state
    end

let process_turning ( state , msg ) =
  match msg with
    | Clock  _ -> state
    | Sensor l -> begin 
      match lnth l.Sensor_msgs.ranges 2 with
      | Some n when n < 1000 -> turn state 
      | _ -> drive state
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

