type t

val create : ?server:string -> string -> t

val getMasterUri     : t -> string Lwt.t
val shutdown         : t -> ?msg:string -> int Lwt.t
val getSubscriptions : t -> ( string * string ) array Lwt.t
val getPublications  : t -> ( string * string ) array Lwt.t
val paramUpdate      : t -> string -> string -> int Lwt.t 
val publisherUpdate  : t -> string -> string list -> int Lwt.t 
val requestTopic     : t -> string -> string list -> string list Lwt.t

