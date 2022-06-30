type 'a file = { mutable contents : 'a list };;

let fileVide () = { contents = [] };;
let estVide f = List.length(f.contents) = 0;;
let enfile e f = f.contents <- f.contents @ [e];;
let defile f =
  if estVide f then
    failwith "file vide"
  else begin
    let liste = ref [] in
    for i = 0 to (List.length f.contents) - 2 do
      let e = List.nth f.contents i in
      liste := !liste @ [e]
    done;
    f.contents <- !liste;
  end;;
let tete f =
  if estVide f then
    failwith "file vide"
  else
    List.nth f.contents (List.length f.contents - 1);;

let f = fileVide();;
enfile 3 f;;
enfile 6 f;;

print_int (tete f);;
print_newline();;

defile f;;

print_int (tete f);;
print_newline();;

defile f;;

print_int (tete f);;
print_newline();;

if estVide(f) then
  print_string("vide")
else
  print_string("pas vide");;

print_newline();;
