let a = 'a';;
a = 'b';;
a := 'b';;

let c = ref 'a';;
c := 'd';;
print_char c;;

print_char !c;;





int_of_char('c');;
int_of_char(!c);;
char_of_int(97);;

for i = 97 to 101 do
	print_char(char_of_int i);
done;;







"Bonjour les MP2I";;

let chaine = "Bonjour les MP2I";;
chaine;;

print_string chaine;;

print_string chaine.[0];;
print_char chaine.[0];;

chaine.[14] <- 'I';;
chaine.[15] <- ' ';;
chaine;;

print_char chaine.[16];;








let s = ref "";;
s := 'a';;

s := "a";;

s;;




let chaine_1 = "Bon";;
let chaine_2 = "jour";;
let chaine_3 = chaine_1 ^ chaine_2;;


let chaine_1 = "aa";;
let chaine_2 =	"ab";;

chaine_1 = chaine_2;;
chaine_1 <> chaine_2;;
chaine_1 <= chaine_2;;


let chaine = "Bonjour";;
let l = String.length chaine;;


let chaine = "Bonjour";;
let l = String.length chaine;;
let copie = String.copy chaine;;
let bis = copie;;

copie.[0] <- 'H';;
copie;;
bis;;
chaine;;





[|3; 2; 1|];;
[|3.; 2; 1|];;
[||];;


let mon_tableau = [|0;2;4;6;8|];;
let tableau_chaine = [|"super"; "tableau"|];;

let tableau = Array.make 5 8;;
let carre_0 x = x * x in Array.init 11 carre_0;;


let carre_1 x = x * x;;
let tableau_1 = Array.init 4 carre_1;;

Array.init 4 (fun x -> x * x);;

let tableau_2 = Array.init 3 (fun x -> x * x);;
tableau_2;;






let rire = Array.make 7 "ha";;

for i = 0 to Array.length rire - 1 do
	print_string rire.(i);
	print_newline();
done;;

rire.(3) <- "ho";;

for i = 0 to Array.length rire - 1 do
	print_string rire.(i);
	print_newline();
done;;



let affiche_premier tab = 
	print_int tab.(0);
	print_newline();
	in
		let t1 = [|4; 6; -3|] in affiche_premier t1;
		let t2 = Array.make 23 (-2) in affiche_premier t1;
	;;

let affiche_premier tab = 
	print_int tab.(0);
	print_newline();;

let affiche_premier tab = 
	print_int tab.(0);
	print_newline();
	in
		let t1 = [|4; 6; -3|] in affiche_premier t1;
		let t2 = Array.make 23 -2 in affiche_premier t1;
	;;






let t3 = Array.make 3 2;;
t3;;
let t4 = t3;;
t3.(0) <- 0;;
t3;;
t4;;
let a = Array.length t3;;
a;;

let t5 = Array.copy t4;;
t4;;
t5;;

t4.(1) <- 4;;

t3;;
t4;;
t5;;




let ts1 = Array.make 3 "baba";;
let ts2 = Array.make 3 ts1.(0);;

ts1;; ts2;;

ts2.(0)<-"bibi";;
ts1.(0).[3] = 'a';;
ts1.(0).[3] <- 'o';;

ts1;; ts2;;



[|1; 2; 3|] = [|1; 2; 3|];;
[|1; 2; 3|] = [|3; 2; 1|];;
let t = [|1;2;3|] in t = Array.copy t;;

[|1; 2; 3|] == [|1; 2; 3|];;
let t = [|1; 2; 3|] in t == Array.copy t;;
let t = [|1;2;3|] in
	let s = t in t == s;;


let double_elements t =
	let n = Array.length t in
	let t1 = Array.make n 0 in
	for i = 0 to n - 1 do
		t1.(i) <- 2 * t.(i)
	done;
	t1;;

let tab = Array.make 3 2;;
let tab_bis = double_elements tab;;




let double_elements t = 
	let n = Array.length t in
	for i = 0 to n - 1 do
		t.(i) <- 2 * t.(i)
	done;;

let table = Array.make 3 4;;
double_elements table;;

table;;



let t = [|4;2|];;
match t with
| [| |] -> "vide"
| [|1;_|] -> "Commence par 1"
| [|2;_|] -> "Commence par 2"
| [|x;y|] -> "t commence par " ^ string_of_int x
| _ -> "Autre cas";;



let matrice_1 = [|
	[| (0,0); (0,1); (0,2) |];
	[| (1,0); (1,1); (1,2) |];
	[| (2,0); (2,1); (2,2) |];
	[| (3,0); (3,1); (3,2) |];
|];;


let triplet_1 = (1,2,"cou");;
triplet_1;;
let a,b,c = triplet_1;;
a;;b;;c;;


let mat_1 =
	let t = Array.make 4 [| |] in
	for i = 0 to 3 do
		let ligne = Array.make 3 (0, 0) in
		for j = 0 to 2 do
			ligne.(j) <- (i,j)
		done;
		
		t.(i) <- ligne
	done;
	t;;

let mat_2 = 
	let elt i j = (i,j) in
	let ligne i = Array.init 3 (elt i) in
	Array.init 4 ligne;;


let mat_3 = Array.make_matrix 2 3 (1,1);;

mat_2.(1);;

mat_2.(1) <- [| (0,0); (0,0); (0,0) |];;
mat_2.(1);;

mat_2;;

let mat_4 =
	let t = Array.make 3 (Array.make 4 (0,0)) in
	for i = 0 to 2 do
		for j = 0 to 3 do
			t.(i).(j) <- (i,j)
		done;
	done;
	t;;

(* Ex 1 *)
let inverse s =
	let n = String.length s in
	let s_inv = String.create n in
	
	for i = 0 to n - 1 do
		s_inv.[n-1-i] <- s.[i];
	done;
	s_inv;;


inverse "repus";;


(* Ex 2 *)
let crochets s =
	let n = String.length s in
	let out = String.create (3 * n) in
	
	for i = 0 to n - 1 do
		out.[3 * i + 0] <- '[';
		out.[3 * i + 1] <- s.[i];
		out.[3 * i + 2] <- ']';
	done;
	out;;

let chaine = crochets "chaine";;

let decrochets s =
	let n = String.length s in
	let out = String.create (n / 3) in
	
	for i = 0 to (n / 3) - 1 do
		out.[i] <- out.[3 * i + 2];
	done;
	out;;

decrochets chaine;;














































