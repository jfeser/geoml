(** Circle manipulation *)

type t = private { center : Point.t; radius : float }
[@@deriving compare, hash, sexp]

val make : Point.t -> float -> t

val center : t -> Point.t

val radius : t -> float

val translate : float -> float -> t -> t

val point_reflection : Point.t -> t -> t

val rotate : t -> Point.t -> float -> t
(** radian rotation. rotate c p f returns the rotated circle of c with p as
    rotation center and f a angle in radian *)

val rotate_angle : t -> Point.t -> float -> t
(** degree rotation. rotate c p f returns the rotated circle of c with p as
    rotation center and f a angle in degree *)

val contains : t -> Point.t -> bool

val area : t -> float

val perimeter : t -> float

val proj_x : t -> float * float

val proj_y : t -> float * float

val tangent : t -> Point.t -> Line.t
(** tangent c p returns the tangent of circle c going through point p.
    p must lie on c's boundary, otherwise behaviour is unspecified *)

val intersects : t -> t -> bool

module Intersection : sig
  type t = None | Tangent of Point.t | Intersect of Point.t * Point.t
  [@@deriving compare, hash, sexp]

  val to_list : t -> Point.t list

  val intersects : t -> bool
end

val intersection : t -> t -> Intersection.t
(** returns the list of intersection points of two circle. It can be:
    - [] when the circles dont intersect
    - [p] when the circles are tangent in p
    - [a;b] when the circles intersect, a and b are the intersection points*)

val intersect_line : t -> Line.t -> Intersection.t
(** same as intersection but with a circle and a line *)

val segment_intersection : t -> Segment.t -> Intersection.t
(** same as intersection but with a circle and a segment *)

val circumscribed : Point.t -> Point.t -> Point.t -> t
(** returns the circumscribed cirle of the triangle defined by the three points*)

val incircle : Point.t -> Point.t -> Point.t -> t
(** returns the incirle of the triangle defined by the three points*)

val of_diameter : Point.t -> Point.t -> t
(** of_diameter a b builds the circle with ab as diameter*)

val bounding : Point.t list -> t
(** given a list of point, returns the smallest circle that
   contains all the points of the list, using emo welzl's algorithm.
    complexity in expected linear time *)

val random_point : t -> Point.t
(** returns a randomly and uniformly chosen point that lies inside the circle *)

val random_point_perimeter : t -> Point.t
(** returns a randomly and uniformly chosen point that lies on the permieter of the circle *)

val print : Formatter.t -> t -> unit
(** printer *)
