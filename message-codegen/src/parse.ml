open Angstrom

let whitespace = take_while1 ( function | ' ' -> true | _ -> false )
let integer = take_while1 (function '0' .. '9' -> true | _ -> false) >>| int_of_string

let alnum = 
  let alpha = function
    | '_' 
    | '0' .. '9'  
    | 'A' .. 'Z' 
    | 'a' .. 'z' -> true
    | _ -> false
    in
  take_while1 alpha

let baseType =
  let rosstring = 
    let* str = choice  
      [ string "string" *> return Rostype.String
      ; string "string" *> return Rostype.Wstring
      ] in
    let* () = (string "<=" *> integer *>  return ()) <|> return () in 
    return str
    in
  choice
  [ string "bool"    *> return Rostype.Bool 
  ; string "byte"    *> return Rostype.Byte
  ; string "char"    *> return Rostype.Char
  ; string "float32" *> return Rostype.Float32
  ; string "float64" *> return Rostype.Float64
  ; string "int8"    *> return Rostype.Int8
  ; string "uint8"   *> return Rostype.Uint8
  ; string "int16"   *> return Rostype.Int16
  ; string "uint16"  *> return Rostype.Uint16
  ; string "int32"   *> return Rostype.Int32
  ; string "uint32"  *> return Rostype.Uint32
  ; string "int64"   *> return Rostype.Int64
  ; string "uint64"  *> return Rostype.Uint64
  ; rosstring
  ] >>= fun x -> return @@ Rostype.Base x

let typeref module_ = 
  choice [ alnum <* char '/' ; return module_] >>= fun module_ ->
  alnum >>= fun name ->
  return @@ Rostype.Typeref { module_ ; name}
  
let array type_ = 
  let inf_arr = string "[]" *> (return None) in
  let fix_arr = 
    let* i = ( string "[<=" *> integer <|> char '[' *> integer )  <* char ']' in
    return @@ Some i 
    in
  let* size = fix_arr <|> inf_arr in 
  return @@ Rostype.Array { size ; type_}

let rostype module_ =
  let* t = choice ~failure_msg:"failed to parse ros type"
    [ baseType ; typeref module_ ] 
    in
  choice [ array t ; return t ]

let maybe_comment = 
  choice
  [ end_of_input
  ; whitespace *> char '#' *> return () 
  ; whitespace *> end_of_input *> return ()
  ]

let message_entry module_ =
  let* type_ = rostype module_ in
  let* name = whitespace *> alnum in
  let field =
    return @@ Rosmessage.Field { type_ ; name }
    in
  let constant  =
    let* value = whitespace *> char '=' *> take_while1 (function '#' -> false | _ -> true ) in
    return @@ Rosmessage.Const { type_ ; name ; value }
    in
  constant <|> field
  