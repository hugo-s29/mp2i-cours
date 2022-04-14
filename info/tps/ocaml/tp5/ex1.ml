let rec exp x n =
  match n with
  | 0                   -> 1
  | 1                   -> x
  | _ when n mod 2 == 0 -> let u = exp x (n / 2) in u * u
  | _ -> let u = exp x ((n-1)/2) in x * u * u
  ;;


print_int(exp 6 5); print_newline();;
print_int(exp 5 4); print_newline();;
