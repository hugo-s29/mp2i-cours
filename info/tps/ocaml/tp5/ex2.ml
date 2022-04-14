let binary_search_iter t e = 
  let res = ref 0 in
  for i = 0 to List.length(t) - 1 do
    if List.nth t i == e then
      res := i;
  done;
  !res;;

let binary_search_rec t e =
  let rec aux t d f e = 
    let m = (d + f) / 2 in
    let vm = List.nth t m in
    if e = vm then
      m
    else if e < vm then
      aux t d m e
    else
      aux t m f e
  in aux t 0 (List.length t) e;;

let t = [1;2;3;4;5;6;7];;

print_int(binary_search_iter t 3); print_newline();;
print_int(binary_search_rec t 3); print_newline();;
