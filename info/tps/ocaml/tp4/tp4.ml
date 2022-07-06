let fact k = 
	let i = ref 1 in
	let f = ref 1 in
	
	while !i < k do
		incr i;
		f := !f * !i;
	done;
	
	!f;;

let rec fact_rec n =
	if n = 0 then 1
	else n * fact_rec(n - 1);;

let rec fact_rec_fil n = 
	match n with
	| 0 -> 1
	| _ -> n * fact_rec_fil(n-1);;

fact_rec_fil 5;;


let rec un n =
	match n with
	| 0 -> 1.
	| _ -> (1. /. 3.) *. (un(n-1) +. 2. *. vn(n-1))
and vn n =
	match n with
	| 0 -> 1.
	| _ -> 0.25 *. (un(n-1) +. 3. *. vn(n-1));;

un 2;; vn 3;;



let rec fibo n =
	match n with
	| 0 -> 1
	| 1 -> 1
	| _ -> fibo(n-1) + fibo(n - 2);;

fibo 8;;

let fibo_term n =
	let rec fib_aux n a b =
		if n = 0 then a
		else fib_aux (n-1) b (a+b)
	in
	fib_aux n 0 1;;

fibo_term 8;;

let rec mystere1 n = 
	match n with
	| 0 -> print_newline();
	| _ -> 
		print_int n;
		print_char ' ';
		mystere1(n-1);
		print_int n;
		print_char ' ';;

mystere1 5;;


let minuscule c = char_of_int (32 + int_of_char c);;

let rec mystere2 s i =
	if i = String.length s then
		print_newline()
	else begin
		print_char s.[i];
		s.[i] <- minuscule s.[i];
		mystere2 s (i+1);
		print_char s.[i];
	end;;

mystere2 "BONJOUR" 0;;


let egalite_composantes = function
	| (x , y) when x = y -> true
	| _ -> false;;

egalite_composantes(0,1);;
egalite_composantes(1.,1.);;


let liste_0 = 1 :: 2 :: 3 :: [];;
let liste_1 = [1; 2; 3];;
let liste_2 = [1, 2, 3];;




