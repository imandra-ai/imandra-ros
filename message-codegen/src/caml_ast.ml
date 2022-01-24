type typeref = { module_ : string ; name : string}
type field  = { fname : string ; ftype : typeref list }
type record = { name : string ; fields : field list }
type variant = { name : string ; cases : string list }

type typedecl =
  | Record of record
  | Variant of variant

type letdecl =
  { name : string
  ; args : string list
  }
  
type statement =
  | Type of typedecl
  | Let of letdecl
  | Module of module_
and module_ =
  { name : string
  ; func_args : (string * string) option
  ; statements : statement
  }



