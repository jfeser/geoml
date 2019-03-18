(* This modules implements verification test over the library *)

let segment() =
  let open Geoml in
  let exn = Invalid_argument "Segment.make: points should be different" in
  Alcotest.check_raises "same point" exn (fun () -> ignore (Segment.make Point.orig Point.orig))

let constructors =
  [ "Segment", `Quick, segment]

let () =
  Alcotest.run "test suite"
    [ "constructors"     , constructors]
