type 'a liste =
  | NIL
  | Cons of 'a * 'a liste;;

let l1 = Cons ("Bonjour", NIL);;

let l2 = Cons (1, (Cons (2, Cons(3, NIL))));;

(*let l3= Cons (1, (Cons ("Bonjour", Cons(3.14, NIL))));;*)
