module Decode( D : Decoders.Decode.S) = struct
  open D.Infix
  module Builtin_interfaces = Builtin_interfaces.Decode(D) 

  let header =
    let* clock = D.field "clock" Builtin_interfaces.time in
    D.succeed Ros_messages.Rosgraph_msgs.{ clock }

end


module Encode( E : Decoders.Encode.S) = struct
  module Builtin_interfaces = Builtin_interfaces.Encode(E) 

  let header : Ros_messages.Rosgraph_msgs.clock E.encoder = fun x -> E.obj
    [ ( "clock" , Builtin_interfaces.time x.clock )
    ]
end