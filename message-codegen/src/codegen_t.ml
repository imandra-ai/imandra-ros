type field =
  { name : string
  ;
  }

type typedecl = 
  { name : string
  ; fields : field list
  }

type module_ =
  { name : string
  ; typedecls : typedecl list
  }




module StrMap = Map.Make(String)


let basetype = 
  let open Rostype in
  function
  | Bool -> "bool"
  | Byte -> "int"
  | Char -> "char"
  | Float32 -> "real" 
  | Float64 -> "real"
  | Int8   | Uint8  | Int16  | Uint16 
  | Int32  | Uint32 | Int64  | Uint64 -> "int"
  | String | Wstring -> "string"

let rec rostype = 
  let open Rostype in
  function
  | Base b -> basetype b
  | Typeref { module_ ; name } ->
    Printf.sprintf "%s.%s" (String.capitalize_ascii module_) (String.uncapitalize_ascii name)
  | Array { type_  ; _ } ->
    Printf.sprintf "%s list" (rostype type_)

let message_type msg =
  let open Rosmessage in
  let { name ; entries ; _ } = msg in
  let () = Printf.printf "    type %s = {\n" (String.uncapitalize_ascii name) in
  let () = entries |> List.iter ( function  
    | Field { name ; type_  } -> Printf.printf "        %s : %s ;\n" (String.uncapitalize_ascii name) (rostype type_) 
    | _ -> ()
    ) in
  let () = Printf.printf "    }\n" in
  ()

let modules modmap =
  let open Msgs_dataset in
  modmap |> StrMap.iter (fun module_ msgs ->
    let () = Printf.printf "module %s = struct\n" (String.capitalize_ascii module_) in
    let () = msgs |> List.iter message_type in
    let () = Printf.printf "end\n\n" in
    () 
  )
  

