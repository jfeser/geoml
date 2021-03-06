type t = float list

let make (l : float list) : t = l

let zero = []

let one = [ 1. ]

let equation p f =
  List.fold_left
    ~f:(fun (pow, res) coeff -> (pow +. 1., res +. (coeff *. Float.(f ** pow))))
    ~init:(0., 0.) (List.rev p)
  |> snd

let add p1 p2 =
  let rec aux res l1 l2 =
    match (l1, l2) with
    | [], [] -> res
    | h1 :: t1, h2 :: t2 -> aux ((h1 +. h2) :: res) t1 t2
    | h :: t, _ | _, h :: t -> aux (h :: res) [] t
  in
  aux zero (List.rev p1) (List.rev p2)

let derive p =
  let rec aux cur res l =
    match l with
    | [] -> res
    | _ :: tl when cur = 0 -> aux 1 res tl
    | h :: tl -> aux (cur + 1) ((Float.of_int cur *. h) :: res) tl
  in
  aux 0 zero (List.rev p)

let print fmt p =
  let open Caml.Format in
  let degree = ref 0 in
  pp_print_list
    ~pp_sep:(fun f () -> fprintf f " + ")
    (fun fmt e ->
      if !degree = 0 then fprintf fmt "%f" e
      else if !degree = 1 then fprintf fmt "%fx" e
      else fprintf fmt "%fx^%i" e !degree;
      Int.incr degree)
    fmt (List.rev p)
