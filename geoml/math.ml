open Arith

(** solve a b c returns the list of the solutions for
    ax² + bx + c = 0 *)
let solve a b c =
  let delta = b*.b -. (of_string "4.") *. a *. c in
  if delta < (of_string "0.") then []
  else
    let racine_delta = sqrt delta in
    let sol1 = (-.b -. racine_delta) /. ((of_string "2.") *.a) in
    if delta = (of_string "0.") then [sol1]
    else let sol2 = (-.b +. racine_delta) /. ((of_string "2.")*.a) in [sol1;sol2]


(** float sum from i to n, f(i) *)
let num_sum i n f =
  let res = ref (of_string "0.") in
  for cpt = i to n do
    res := !res +. f cpt
  done;
  !res

(** integer sum from i to n, f(i) *)
let int_sum i n f =
  let res = ref 0 in
  for cpt = i to n do
    res := !res + f cpt
  done;
  !res

let pi = of_string "3.141592653589793"

let deg_to_rad = (of_string "0.0174533")
