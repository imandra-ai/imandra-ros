type basetype =
  | Bool
  | Byte
  | Char
  | Float32
  | Float64
  | Int8
  | Uint8
  | Int16
  | Uint16
  | Int32
  | Uint32
  | Int64
  | Uint64
  | String
  | Wstring

type t =
  | Base of basetype
  | Typeref of { module_ : string ; name : string }
  | Array of { type_ : t ; size : int option }
