module StrMap = Map.Make(String)
module StrSet = Set.Make(String)

type entry =
  | Field of { name : string ; type_ : Rostype.t }
  | Const of { name : string ; type_ : Rostype.t ; value : string}


type message = 
  { module_ : string
  ; name : string
  ; entries : entry list
  }

type program = message list StrMap.t

let dependencies ( data : program ) =
  let msg_dependencies ( message : message ) =
    let rec get_type_module (t : Rostype.t) =
      match t with Base _ -> None
      | Typeref {module_ ; _} -> Some module_
      | Array { type_ ; _ } -> get_type_module type_
      in
    message.entries |> List.fold_left ( fun acc x ->
      let type_ = match x with 
        | Field { type_ ; _ } -> type_ 
        | Const { type_ ; _ } -> type_ 
        in
      match get_type_module type_ with None -> acc | Some m ->
      StrSet.add m acc
    ) StrSet.empty
    in
  data |> StrMap.map (fun msglst ->
    msglst 
    |> List.map msg_dependencies 
    |> List.fold_left StrSet.union StrSet.empty 
  )
  



