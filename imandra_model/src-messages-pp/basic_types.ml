module Decode( D : Decoders.Decode.S) = struct
  open D.Infix

  let int = 
    let* i = D.int in
    D.succeed (Z.of_int i) 

  let float =
    let* value = D.field "value" int in
    let* precision = D.field "precision" int in
    D.succeed Ros_messages.Basic_types.{ value ; precision }

end


module Encode( E : Decoders.Encode.S) = struct
  let int : Z.t E.encoder = fun x -> E.int ( Z.to_int x)  
  let float : Ros_messages.Basic_types.float  E.encoder = fun x -> E.obj
    [ ( "value" , int x.value )
    ; ( "precision" , int x.precision )
    ]
end