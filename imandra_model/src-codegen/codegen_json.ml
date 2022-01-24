module Decode(D : Decoders.Decode.S) = struct
  open D.Infix

  let typeref : Codegen.typeref D.decoder =
    D.fix @@ fun typeref ->
    D.single_field @@ function
    | "raw" -> D.string >>= fun x -> D.succeed @@ Codegen.Raw x
    | "basic" -> D.string >>= fun x -> D.succeed @@ Codegen.Basic x
    | "record" -> 
      let* module_ = D.field_opt "module" D.string in
      let* name = D.field "name" D.string in
      D.succeed @@ Codegen.RecordRef { module_ ; name }
    | "list" -> 
      typeref >>= fun x -> D.succeed @@ Codegen.List x
    | s -> D.fail @@ "Failed to decode typeref " ^ s

  let rosfield : Codegen.field D.decoder =
    let* ros2_name = D.field "name" D.string in
    let* ftype = D.field "type" typeref in
    let caml_name = ros2_name in
    D.succeed Codegen.
    { caml_name
    ; ros2_name
    ; ftype 
    }

  let rosmsg : Codegen.rosmsg D.decoder =
    let* name = D.field "name" D.string in
    let* fields = D.field "fields" (D.list rosfield) in
    D.succeed Codegen.
    { name 
    ; fields 
    }

  let rosmodule : Codegen.rosmodule D.decoder =
    let* name = D.field "name" D.string in
    let* messages = D.field "messages" (D.list rosmsg) in
    D.succeed Codegen.
    { name 
    ; messages 
    }

  let modules : Codegen.rosmodule list D.decoder =
    let* result = D.field "modules" (D.list rosmodule) in
    D.succeed result 
  
end