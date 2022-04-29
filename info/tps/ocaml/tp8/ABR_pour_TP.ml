type 'a a =
| V
| N of 'a * 'a a * 'a a;;


let rec f1 x a = match a with 
| V 							-> false
| N(y, _, _) when y = x	-> true
| N(y, m, _) when y > x	-> f1 x m
| N(y, _, n)				-> f1 x n;;


let rec f2 x a = match a with
| V							-> V
| N (y, m, n) when y>x	-> N (y, f2 x m, n)
| N (y, m, n) when y<x	-> N (y, m, f2 x n)
| N (_, V, n)				-> n
| N (_, m, n)				-> let y, m' = f11 m in N (y, m', n)
and f11 a = match a with
| N (x, m, V)	-> x, m
| N (x, m, n)	-> let y, n' = f11 n in y, N(x, m, n');;


let rec f3 x a = match a with
| V							-> N (x, V, V)
| N (y, m, n)	when y>x	-> N (y, f3 x m, n)
| N (y, m, n) when y<x	-> N (y, m, f3 x n)
| _							-> a;;


let rec f4 l = match l with
| []		-> V
| x :: q	-> f3 x (f4 q);;


let rec f5 x a = match a with
| V				-> V
| N (y, m, n) when y>x	-> N (y, f5 x m, n)
| N (y, m, n) when y<x	-> N (y, m, f5 x n)
| N (_, m, n)				-> f m n
and f a b = match a with
| V					-> b
| N (y, my, ny)	-> N (y, my, f ny b);;

let rec f6 a = match a with
| V			-> 0
| N(_,m,n)	-> 1 + f6 m + f6 n;;

let f7 a = match a with
| N(y,N(x, mx, nx), ny)	-> N(x, mx, N (y, nx, ny))
| _										-> failwith "message à préciser !";;

let rec f10 a = match a with
| V				-> failwith "message à préciser !"
| N(x, _, V)	-> x
| N(_,_,n)		-> f10 n;;
