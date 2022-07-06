
(*ex 3*)
let x = ref 2 in
for k = 1 to 10 do
	print_int k;
	print_string " + ";
	print_int !x;
	print_string " = ";
	
	x := k + !x;
	print_int !x;
	print_newline();
done;;

(*ex 4*)
for k = 0 to 20 do
	let x = 9 * k in
	print_int 9;
	print_string " x ";
	print_int k;
	print_string " = ";
	print_int x;
	print_newline();
done;;

(*ex 5*)
let sum = ref 0 in
let k = ref 1 in
while !k < 6 do
	sum := !sum + !k;
	print_int !k;
	print_string "\t";
	print_int !sum;
	print_newline();
	incr k;
done;;

(*ex 6*)
for n = 1 to 100 do
	if n mod 31 = 0 then begin
		print_int n;
		print_newline();
	end;
	
	if n * n <= 100 then begin
		print_int (n * n);
		print_newline();
	end;
done;;

for n = 1 to 100 do
	if n mod 31 = 0 then begin
		print_int n;
		print_newline();
	end;
	
	for i = 1 to 10 do
		if i * i = n then begin
			print_int n;
			print_newline();
		end;
	done;
done;;