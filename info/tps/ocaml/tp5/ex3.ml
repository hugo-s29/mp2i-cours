let max t =
  let rec aux t d f =
    if f - d <= 1 then
      List.nth t d
    else
      let m = (d + f) / 2 in
      let a = aux t d m in
      let b = aux t m f in
      if a < b then b else a
  in aux t 0 (List.length t);;

let t = [1;2;7;4;5;6;2];;

print_int(max t); print_newline();;
