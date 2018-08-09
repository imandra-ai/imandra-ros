type t

val create : ?server:string -> string -> t

(* http://wiki.ros.org/ROS/Master_API *)

val registerService      : t -> string -> string -> string -> string Lwt.t
val registerSubscriber   : t -> string -> string -> string -> string list Lwt.t
val registerPublisher    : t -> string -> string -> string -> string list Lwt.t

val unregisterService    : t -> string -> string -> int Lwt.t
val unregisterSubscriber : t -> string -> string -> int Lwt.t
val unregisterPublisher  : t -> string -> string -> int Lwt.t

val lookupNode           : t -> string -> string  Lwt.t 
val getPublishedTopics   : t -> string -> ( string * string ) array  Lwt.t
val getTopicTypes        : t -> ( string * string ) array Lwt.t

type system_state =
  { publishers  : (string * string list) array 
  ; subscribers : (string * string list) array 
  ; services    : (string * string list) array
  }
     
  
val getSystemState       : t -> system_state Lwt.t
val getUri               : t -> string Lwt.t
val lookupService        : t -> string -> string Lwt.t 
