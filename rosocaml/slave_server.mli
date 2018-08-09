type t

val create : ?server:string -> int -> string -> t
val publishers : t -> string list Lwt_mvar.t

val slave_server_thread : t -> unit Lwt.t