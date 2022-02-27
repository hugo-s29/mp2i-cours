let f (x,y) = x*x + y*y in f(2,1);;
let f x y = x*x + y*y in f 2 1;;

(* Exercice 1 *)
let a = 2;;
let f x = a*x ;;
(* val f: int -> int = <fun> *)
let a = 3 in f 1 ;;
(* val a: int = 2 *)
let a = 3 ;;
f 1 ;;
(* - : int = 2 *)

let a =
  let a = 3 and b = 2 in
    let a = a+b and b = a-b in
      a-b;;
(* val a : int = 4 *)

let b = 2 in a-b*b;;
(* val b : int = 0 *)


(* Exercice 2 *)
let x = sqrt(7.) in (1. +. x +. x**3.) /. (1. +. exp(x));;
let x = log(5.) in (log(cos(1.)) +. sin(x)) /. (cos(1.) +. x);;
let th x = 
  let k = exp(2. *. x) in
    (k -. 1.) /. (k +. 1.);
  k;;
