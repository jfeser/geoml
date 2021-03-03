(** Strict and large linear constraints mmanipulation *)

type comp = Lt | Gt | Leq | Geq

val neg : comp -> comp

type t = private Line.t * comp

val make : Line.t -> comp -> t

val get_comp : t -> comp

val get_border : t -> Line.t

val contains : t -> Point.t -> bool
(**contains c p returns true if the point p is in the half-space defined by c*)

val complementary : t -> t
(** returns the complementary constraint of a constraint *)

val translate : float -> float -> t -> t

val intersects : t -> t -> bool

val print : Formatter.t -> t -> unit
