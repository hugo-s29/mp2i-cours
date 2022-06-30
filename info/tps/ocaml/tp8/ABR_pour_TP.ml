type 'a arbre =
  | Vide
  | Noeud of 'a * 'a arbre * 'a arbre;;


let rec contientElement x a = match a with 
  | Vide               							        -> false
  | Noeud(y, _, _)               when y = x -> true
  | Noeud(y, sousArbreGauche, _) when y > x	-> contientElement x sousArbreGauche
  | Noeud(y, _, sousArbreDroit)			  	    -> contientElement x sousArbreDroit;;


let rec f2 x a = match a with
  | Vide							       -> Vide
  | Noeud (y, m, n) when y>x -> Noeud (y, f2 x m, n)
  | Noeud (y, m, n) when y<x -> Noeud (y, m, f2 x n)
  | Noeud (_, Vide, n)			 -> n
  | Noeud (_, m, n)			     -> let y, m' = f11 m in Noeud (y, m', n)
  and f11 a = match a with
  | Noeud (x, m, Vide)       -> x, m
  | Noeud (x, m, n)          -> let y, n' = f11 n in y, Noeud(x, m, n');;


let rec insererElement x arbre = match arbre with
  | Vide							                                    -> Noeud (x, Vide, Vide)
  | Noeud (y, sousArbreGauche, sousArbreDroit)	when y>x	-> Noeud (y, insererElement x sousArbreGauche, sousArbreDroit)
  | Noeud (y, sousArbreGauche, sousArbreDroit)  when y<x	-> Noeud (y, sousArbreGauche, insererElement x sousArbreDroit)
  | _						            	                            -> arbre;;


let rec arbreListe l = match l with
  | []		  -> Vide
  | x :: q	-> insererElement x (arbreListe q);;


let rec f5 x a = match a with
  | Vide				              -> Vide
  | Noeud (y, m, n) when y>x	-> Noeud (y, f5 x m, n)
  | Noeud (y, m, n) when y<x	-> Noeud (y, m, f5 x n)
  | Noeud (_, m, n)	    			-> f m n
  and f a b = match a with
  | Vide				    	        -> b
  | Noeud (y, my, ny)	        -> Noeud (y, my, f ny b);;

let rec tailleArbre a = match a with
  | Vide                                    -> 0
  | Noeud(_,sousArbreGauche,sousArbreDroit) -> 1 + tailleArbre sousArbreGauche + tailleArbre sousArbreDroit;;

let f7 a = match a with
  | Noeud(y, Noeud(x, mx, nx), ny)	-> Noeud(x, mx, Noeud (y, nx, ny))
  | _										            -> failwith "message à préciser !";;

let rec f10 a = match a with
  | Vide      				-> failwith "message à préciser !"
  | Noeud(x, _, Vide)	-> x
  | Noeud(_,_,n)		  -> f10 n;;
