module J  = Yojson.Basic
module JU = Yojson.Basic.Util 


let jreq json key parser f =
  let v = JU.member key json in
  if v == `Null then None else
  match parser v with
  | Some v -> f v
  | None -> None


let jlist parser ( json : J.json) = 
  let rec scan = function
    | Some x :: tl ->
      ( match scan tl with None -> None | Some tl -> Some ( x :: tl ) )
    | None :: tl -> None
    | [] -> Some []
    in
  match json with
  | `List lst -> lst |> List.map parser |> scan
  | _ -> None
  

let assoc_filter_nulls l : J.json =
  `Assoc ( List.filter (function ( _ , `Null ) -> false | _ -> true ) l )


