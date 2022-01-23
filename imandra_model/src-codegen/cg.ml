
module D = Decoders_yojson.Basic.Decode
module CD = Ros_codegen.Codegen_json.Decode(D)



let () =
  match D.decode_file CD.modules "./src-codegen/msgs.json" with
  | Error e -> 
    let () = print_endline @@ D.string_of_error e in
    failwith "Failed decoding json"
  | Ok modules ->
  let open Ros_codegen.Codegen in
  let ch = open_out "src-rosmsg/ros_messages.iml" in 
  let ppf = Format.formatter_of_out_channel ch in
  let () = Type.types_pp ppf modules in
  let () = close_out ch in
  let ch = open_out "src-rosmsg/ros_messages_json.ml" in 
  let ppf = Format.formatter_of_out_channel ch in
  let () = Decoder.decoders_pp ppf modules in
  let () = Encoder.encoders_pp ppf modules in
  let () = close_out ch in
  ()
