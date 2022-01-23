module Decode( D : Decoders.Decode.S) = struct 
  open D.Infix
  
  module Basic_types = struct
    let int =
      let* i = D.int in
      D.succeed (Z.of_int i)
    
     let float =
       let* value = D.field "value" int in
       let* precision = D.field "precision" int in
       D.succeed Ros_messages.Basic_types.{ value ; precision }
  end
  
  module Builtin_interfaces = 
  struct
    let time : Ros_messages.Builtin_interfaces.time D.decoder =
      let* sec = D.field "sec" Basic_types.int in
      let* nanosec = D.field "nanosec" Basic_types.int in
      D.succeed ( Ros_messages.Builtin_interfaces.
      { sec
      ; nanosec
      } : Ros_messages.Builtin_interfaces.time)
  end
  
  module Rosgraph_msgs = 
  struct
    let clock : Ros_messages.Rosgraph_msgs.clock D.decoder =
      let* clock = D.field "clock" Builtin_interfaces.time in
      D.succeed ( Ros_messages.Rosgraph_msgs.
      { clock
      } : Ros_messages.Rosgraph_msgs.clock)
  end
  
  module Std_msgs = 
  struct
    let header : Ros_messages.Std_msgs.header D.decoder =
      let* stamp = D.field "stamp" Builtin_interfaces.time in
      let* frame_id = D.field "frame_id" D.string in
      D.succeed ( Ros_messages.Std_msgs.
      { stamp
      ; frame_id
      } : Ros_messages.Std_msgs.header)
  end
  
  module Sensor_msgs = 
  struct
    let laser_scan : Ros_messages.Sensor_msgs.laser_scan D.decoder =
      let* header = D.field "header" Std_msgs.header in
      let* angle_min = D.field "angle_min" Basic_types.float in
      let* angle_max = D.field "angle_max" Basic_types.float in
      let* angle_increment = D.field "angle_increment" Basic_types.float in
      let* time_increment = D.field "time_increment" Basic_types.float in
      let* scan_time = D.field "scan_time" Basic_types.float in
      let* range_min = D.field "range_min" Basic_types.float in
      let* range_max = D.field "range_max" Basic_types.float in
      let* ranges = D.field "ranges" (D.list Basic_types.float) in
      let* intensities = D.field "intensities" (D.list Basic_types.float) in
      D.succeed ( Ros_messages.Sensor_msgs.
      { header
      ; angle_min
      ; angle_max
      ; angle_increment
      ; time_increment
      ; scan_time
      ; range_min
      ; range_max
      ; ranges
      ; intensities
      } : Ros_messages.Sensor_msgs.laser_scan)
  end
  
  module Geometry_msgs = 
  struct
    let point : Ros_messages.Geometry_msgs.point D.decoder =
      let* x = D.field "x" Basic_types.float in
      let* y = D.field "y" Basic_types.float in
      let* z = D.field "z" Basic_types.float in
      D.succeed ( Ros_messages.Geometry_msgs.
      { x
      ; y
      ; z
      } : Ros_messages.Geometry_msgs.point)
    
    let vector3 : Ros_messages.Geometry_msgs.vector3 D.decoder =
      let* x = D.field "x" Basic_types.float in
      let* y = D.field "y" Basic_types.float in
      let* z = D.field "z" Basic_types.float in
      D.succeed ( Ros_messages.Geometry_msgs.
      { x
      ; y
      ; z
      } : Ros_messages.Geometry_msgs.vector3)
    
    let twist : Ros_messages.Geometry_msgs.twist D.decoder =
      let* linear = D.field "linear" vector3 in
      let* angular = D.field "angular" vector3 in
      D.succeed ( Ros_messages.Geometry_msgs.
      { linear
      ; angular
      } : Ros_messages.Geometry_msgs.twist)
  end
end

module Encode( E : Decoders.Encode.S) = struct 
  module Basic_types = struct
    let int : Z.t E.encoder = fun x -> E.int ( Z.to_int x)
    
    let float : Ros_messages.Basic_types.float  E.encoder = fun x -> E.obj
      [ ( "value" , int x.value )
      ; ( "precision" , int x.precision )
      ]
  end
  
  module Builtin_interfaces = 
  struct
    let time : Ros_messages.Builtin_interfaces.time E.encoder = fun x -> E.obj
      [ ( "sec" ,  Basic_types.int x.sec )
      ; ( "nanosec" ,  Basic_types.int x.nanosec )
      ]
  end
  
  
  module Rosgraph_msgs = 
  struct
    let clock : Ros_messages.Rosgraph_msgs.clock E.encoder = fun x -> E.obj
      [ ( "clock" ,  Builtin_interfaces.time x.clock )
      ]
  end
  
  
  module Std_msgs = 
  struct
    let header : Ros_messages.Std_msgs.header E.encoder = fun x -> E.obj
      [ ( "stamp" ,  Builtin_interfaces.time x.stamp )
      ; ( "frame_id" ,  E.string x.frame_id )
      ]
  end
  
  
  module Sensor_msgs = 
  struct
    let laser_scan : Ros_messages.Sensor_msgs.laser_scan E.encoder = fun x -> E.obj
      [ ( "header" ,  Std_msgs.header x.header )
      ; ( "angle_min" ,  Basic_types.float x.angle_min )
      ; ( "angle_max" ,  Basic_types.float x.angle_max )
      ; ( "angle_increment" ,  Basic_types.float x.angle_increment )
      ; ( "time_increment" ,  Basic_types.float x.time_increment )
      ; ( "scan_time" ,  Basic_types.float x.scan_time )
      ; ( "range_min" ,  Basic_types.float x.range_min )
      ; ( "range_max" ,  Basic_types.float x.range_max )
      ; ( "ranges" ,  (E.list Basic_types.float) x.ranges )
      ; ( "intensities" ,  (E.list Basic_types.float) x.intensities )
      ]
  end
  
  
  module Geometry_msgs = 
  struct
    let point : Ros_messages.Geometry_msgs.point E.encoder = fun x -> E.obj
      [ ( "x" ,  Basic_types.float x.x )
      ; ( "y" ,  Basic_types.float x.y )
      ; ( "z" ,  Basic_types.float x.z )
      ]
    
    let vector3 : Ros_messages.Geometry_msgs.vector3 E.encoder = fun x -> E.obj
      [ ( "x" ,  Basic_types.float x.x )
      ; ( "y" ,  Basic_types.float x.y )
      ; ( "z" ,  Basic_types.float x.z )
      ]
    
    let twist : Ros_messages.Geometry_msgs.twist E.encoder = fun x -> E.obj
      [ ( "linear" ,  vector3 x.linear )
      ; ( "angular" ,  vector3 x.angular )
      ]
  end
  
end

