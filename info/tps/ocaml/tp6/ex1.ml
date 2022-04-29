type point = { mutable x : float; mutable y : float };;
type vecteur = { mutable dx : float; mutable dy : float };;

let extremite p v = { x = p.x +. v.dx; y = p.y +. v.dy };;
let rotation v =
  let (a,b) = (v.dx, v.dy) in
  v.dx <- 0. -. b;
  v.dy <- a;
  v;;

