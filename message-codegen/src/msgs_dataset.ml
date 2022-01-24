type msg =
  { module_ : string
  ; name : string
  ; code : string list
  }

type t = msg list

module Decode(D : Decoders.Decode.S) = struct
  open D.Infix
  let t : t D.decoder = 
    let* pairs = D.key_value_pairs D.string in
    pairs |> List.map ( fun (name, c) ->
      let code = Str.(split (regexp "\n") c) in
      match Str.(split (regexp "/") name) with
      | [ module_ ; "msg"; name ] -> { module_; name ; code }
      | _ -> failwith "Failed to extract name and module from the message name" 
    ) |> D.succeed
end


let filter_code code =
  code |> List.filter ( fun line ->
    not Str.( string_match (regexp "^[ \t]*\\(#.*\\)?$") line 0 )
  ) |> List.filter ( fun line -> String.get line 0 <> '\t' )


let process_entry msg =
  let code = filter_code msg.code in
  let parser = Parse.message_entry msg.module_ in
  code |> List.filter_map @@ ( fun row -> 
    match Angstrom.parse_string parser ~consume:Prefix row with
    | Ok x -> Some x
    | Error _ -> 
      let () = Printf.printf "  Failed to parse row \"%s\" of the %s/%s message\n" row msg.module_ msg.name in
      None
  )

module StrMap = Map.Make(String)

let parse_data data =
  let rosmessages = data |> List.map @@ ( fun msg -> 
      let { module_ ; name ; _ } = msg in
      let () =  Printf .printf "Parsing message %s/%s\n" module_ name in
      Rosmessage.{ module_ ; name ; entries = process_entry msg }
    ) in
  rosmessages |> List.fold_left ( fun map msg ->
    let open Rosmessage in
    map |> StrMap.update msg.module_ (function 
      | None -> Some [msg]
      | Some lst -> Some ( msg::lst) 
    )
  ) StrMap.empty
  


  


