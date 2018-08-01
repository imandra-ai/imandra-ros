type t

val create : ?server:string -> string -> t

(* http://wiki.ros.org/ROS/Master_API *)

val registerService      : t -> string -> string -> string -> ( int * string * string ) Lwt.t
val registerSubscriber   : t -> string -> string -> string -> ( int * string * string list ) Lwt.t
val registerPublisher    : t -> string -> string -> string -> ( int * string * string list ) Lwt.t

val unregisterService    : t -> string -> string -> ( int * string * int ) Lwt.t
val unregisterSubscriber : t -> string -> string -> ( int * string * int ) Lwt.t
val unregisterPublisher  : t -> string -> string -> ( int * string * int ) Lwt.t

val lookupNode           : t -> string -> ( int * string * string ) Lwt.t 
val getPublishedTopics   : t -> string -> ( int * string * ( string * string ) array ) Lwt.t
val getTopicTypes        : t -> ( int * string * ( string * string ) array ) Lwt.t

type system_state =
  ( int 
  * string 
  * ( (string * string list) array 
    * (string * string list) array 
    * (string * string list) array
    )
  )  
  
val getSystemState       : t -> system_state Lwt.t
val getUri               : t -> ( int * string * string ) Lwt.t
val lookupService        : t -> string -> ( int * string * string ) Lwt.t 
