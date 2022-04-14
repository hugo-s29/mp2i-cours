let max a b = if a < b then b else a;;
let min a b = if a < b then a else b;;

let merge a b =
  let na = List.length a and nb = List.length b in
  let i = ref 0 in
  let j = ref 0 in
  let out = ref [] in

  while !i < na && !j < nb do
    let vi = List.nth a (min !i (na - 1)) in
    let vj = List.nth b (min !j (nb - 1)) in

    if vi < vj then
      begin
        out := !out @ [vi];
        incr i;
      end
    else
      begin
        out := !out @ [vj];
        incr j;
      end
  done;

  !out;;

let t = merge [2;4;6] [1;3;5;7;8] in
for i = 0 to List.length(t) - 1 do
  print_int(List.nth t i);
  print_char ' ';
done;;
