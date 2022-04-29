let pileVide () = [];;

let empile elem p = elem :: p;;

let depile p = 
  if List.length p == 0 then
    failwith "Pile vide"
  else
    let temp = ref (pileVide()) in

    for i = 0 to (List.length p) - 2 do
      temp := empile (List.nth p i) !temp
    done;

    !temp;;

let estVide p = List.length p = 0;;

let sommet pile = List.nth pile (List.length pile - 1);;

let pile = pileVide();;
let pile = empile 3 pile;;
let pile = empile 2 pile;;
let pile = depile pile;;
print_int(sommet pile);;


