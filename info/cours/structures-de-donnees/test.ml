(* Sommet : identifiant et liste de voisins *)
type 'a sommet = { id : 'a; voisins : 'a list};;

(* Graphe : liste de sommets *)
type 'a graphe = 'a sommet list;;

let rec supprime_arete g a b = match g with
  | [] -> []
  | s :: q when s.id = a ->
    let rec aux l = match l with
      | [] -> []
      | u :: q when u = b -> q
      | u :: q -> u :: (aux q)
    in { id = a; voisins = (aux s.voisins) } :: q
  | s :: q -> s :: supprime_arete q a b;;

let liste_to_matrice liste =
  let n = List.length liste in
  let matrice = Array.make_matrix n n 0 in

  for a = 0 to (n - 1) do
    let voisins = (List.nth liste a).voisins in

    for b = 0 to (List.length voisins - 1) do
      matrice.(a).(List.nth voisins b) <- 1;
    done;
  done;

  matrice;;
