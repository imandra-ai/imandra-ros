type typeref =
  | Raw of string
  | Basic of string
  | RecordRef of { module_ : string option; name : string }
  | List of typeref

type field =
  { caml_name : string
  ; ros2_name : string
  ; ftype : typeref
  }

type rosmsg =
  { name : string
  ; fields : field list
  }

type rosmodule =
  { name : string
  ; messages : rosmsg list
  }


let msg_module = "Ros_messages"
let type_path module_ ppf () =
  Format.fprintf ppf "%s.%s." msg_module module_ 
let full_typename_pp module_ ppf ( rosmsg : rosmsg ) =
  Format.fprintf ppf "%a%s" (type_path module_) () rosmsg.name

module Type = struct
  open CCFormat

  let rec typeref_pp ppf ( typeref : typeref ) =
    match typeref with
    | Raw t -> fprintf ppf "%s" t
    | Basic t -> fprintf ppf "Basic_types.%s" t
    | RecordRef { module_= None ; name } -> fprintf ppf "%s" name
    | RecordRef { module_= Some m ; name } -> fprintf ppf "%s.%s" m name
    | List t -> fprintf ppf "%a list" typeref_pp t

  let field_pp ppf ( field : field ) =
    fprintf ppf "%s : %a" field.caml_name typeref_pp field.ftype

  let rosmsg_pp ppf ( rosmsg : rosmsg ) =
    fprintf ppf "@[<v>type %s =@;<1 2>@[<v>{ %a@,}@]@]" 
      rosmsg.name 
      (list ~sep:(return "@,; ") field_pp) rosmsg.fields

  let module_pp ppf (rosmodule : rosmodule) =
    fprintf ppf "@[<v>module %s = @;struct@;<1 2>@[<v>%a@]@,end@]" 
    rosmodule.name
    (list ~sep:(return "@,@,") rosmsg_pp) rosmodule.messages
  

  let type_prelude_pp ppf () =
    let prelude =
      [ "module Basic_types = struct"
      ; "  type int = Z.t" 
      ; "  "
      ; "  type float = { value : int ; precision : int }"
      ; "end"
      ; ""
      ] in
    fprintf ppf "%a"  (list ~sep:(return "@,") string) prelude 
    
  let types_pp ppf (modules : rosmodule list) =
    fprintf ppf "@[<v>%a@,%a@]@." 
    type_prelude_pp ()
    (list ~sep:(return "@,@,") module_pp) modules
  
end

module Decoder = struct
  open CCFormat

  let rec type_decoder_pp ppf ( typeref : typeref ) =
    match typeref with
    | Raw t -> fprintf ppf "D.%s" t
    | Basic t -> fprintf ppf "Basic_types.%s" t
    | RecordRef { module_= None ; name } -> fprintf ppf "%s" name
    | RecordRef { module_= Some m ; name } -> fprintf ppf "%s.%s" m name
    | List t -> fprintf ppf "(D.list %a)" type_decoder_pp t

  let fields_decoder_pp =
    let pp ppf field = 
      fprintf ppf "let* %s = D.field \"%s\" %a in" 
        field.caml_name
        field.ros2_name 
        type_decoder_pp field.ftype
      in
    (list ~sep:(return "@,") pp) 
     
  let fields_constructor_pp=
    let pp ppf field = fprintf ppf "%s" field.caml_name in
    (list ~sep:(return "@,; ") pp) 

  let succeed_pp module_ ppf () =
    fprintf ppf "D.succeed ( %a" (type_path module_) ()
  
  let rosmsg_pp module_ ppf ( rosmsg : rosmsg ) =
    fprintf ppf "@[<v>let %s : %a D.decoder =@;<1 2>@[<v>%a@,%a@,{ %a@,} : %a)@]@]" 
      rosmsg.name
      (full_typename_pp module_) rosmsg
      fields_decoder_pp rosmsg.fields
      (succeed_pp module_) ()
      fields_constructor_pp rosmsg.fields
      (full_typename_pp module_) rosmsg
      
  let module_pp ppf (rosmodule : rosmodule) =
    fprintf ppf "@[<v>module %s = @;struct@;<1 2>@[<v>%a@]@,end@]" 
    rosmodule.name
    (list ~sep:(return "@,@,") (rosmsg_pp rosmodule.name)) rosmodule.messages
    
  

  let decoders_prelude_pp ppf () =
    let prelude =
      [ "open D.Infix"
      ; ""
      ; "module Basic_types = struct"
      ; "  let int =" 
      ; "    let* i = D.int in"
      ; "    D.succeed (Z.of_int i)" 
      ; "  "
      ; "   let float ="
      ; "     let* value = D.field \"value\" int in"
      ; "     let* precision = D.field \"precision\" int in"
      ; "     D.succeed Ros_messages.Basic_types.{ value ; precision }"
      ; "end"
      ; ""
      ] in
    fprintf ppf "%a"  (list ~sep:(return "@,") string) prelude 
    
  let decoders_pp ppf (modules : rosmodule list) =
    fprintf ppf "@[<v>module Decode( D : Decoders.Decode.S) = struct @;<1 2>@[<v>%a@,%a@]@;end@;@]@." 
    decoders_prelude_pp ()
    (list ~sep:(return "@,@,") module_pp) modules


end

module Encoder = struct
  open CCFormat

  let rec type_encoder_pp ppf ( typeref : typeref ) =
    match typeref with
    | Raw t -> fprintf ppf "E.%s" t
    | Basic t -> fprintf ppf "Basic_types.%s" t
    | RecordRef { module_= None ; name } -> fprintf ppf "%s" name
    | RecordRef { module_= Some m ; name } -> fprintf ppf "%s.%s" m name
    | List t -> fprintf ppf "(E.list %a)" type_encoder_pp t

  let fields_encoder_pp =
    let pp ppf field = 
      fprintf ppf "( \"%s\" ,  %a x.%s )" 
        field.caml_name
        type_encoder_pp field.ftype
        field.ros2_name 
      in
    (list ~sep:(return "@,; ") pp) 
    
  let rosmsg_pp module_ ppf ( rosmsg : rosmsg ) =
    fprintf ppf "@[<v>let %s : %a E.encoder = fun x -> E.obj@;<1 2>@[<v>[ %a@,]@]@]" 
      rosmsg.name
      (full_typename_pp module_) rosmsg
      fields_encoder_pp rosmsg.fields

  let module_pp ppf (rosmodule : rosmodule) =
    fprintf ppf "@[<v>module %s = @;struct@;<1 2>@[<v>%a@]@;end@;@]" 
    rosmodule.name
    (list ~sep:(return "@,@,") (rosmsg_pp rosmodule.name)) rosmodule.messages


  let encoders_prelude_pp ppf () =
    let prelude =
      [ "module Basic_types = struct"
      ; "  let int : Z.t E.encoder = fun x -> E.int ( Z.to_int x)" 
      ; "  "
      ; "  let float : Ros_messages.Basic_types.float  E.encoder = fun x -> E.obj"
      ; "    [ ( \"value\" , int x.value )"
      ; "    ; ( \"precision\" , int x.precision )"
      ; "    ]"   
      ; "end"
      ; ""
      ] in
    fprintf ppf "%a"  (list ~sep:(return "@,") string) prelude 
    
  let encoders_pp ppf (modules : rosmodule list) =
    fprintf ppf "@[<v>module Encode( E : Decoders.Encode.S) = struct @;<1 2>@[<v>%a@,%a@]@;end@;@]@." 
    encoders_prelude_pp ()
    (list ~sep:(return "@,@,") module_pp) modules
  
end






