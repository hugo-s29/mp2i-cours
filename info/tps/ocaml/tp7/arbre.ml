type arbre =
  | Vide
  | Noeud of arbre * int * arbre;;

let a = Noeud(
  Noeud(
    Noeud(
      Noeud(
        Vide,
        21,
        Noeud(Vide, 23, Vide)
      ),
      27,
      Vide
    ),
    63,
    Noeud(
      Noeud(
        Vide,
        67,
        Noeud(Vide, 68, Vide)
      ),
      71,
      Noeud(Vide, 79, Vide)
    )
  ),
  145,
  Noeud(
    Noeud(Vide, 171, Vide),
    190,
    Vide
  )
);;

let rec parcoursPrefixe a =
  match a with
  | Vide -> begin end;
  | Noeud(a1, n, a2) -> begin
    print_char('(');
    print_int(n);
    print_char(',');
    parcoursPrefixe a1;
    print_char(',');
    parcoursPrefixe a2;
    print_char(')');
  end;;

let rec parcoursInfixe a =
  match a with
  | Vide -> begin end;
  | Noeud(a1, n, a2) -> begin
    print_char('(');
    parcoursPrefixe a1;
    print_char(',');
    print_int(n);
    print_char(',');
    parcoursPrefixe a2;
    print_char(')');
  end;;

let rec parcoursPostfixe a =
  match a with
  | Vide -> begin end;
  | Noeud(a1, n, a2) -> begin
    print_char('(');
    parcoursPrefixe a1;
    print_char(',');
    parcoursPrefixe a2;
    print_char(',');
    print_int(n);
    print_char(')');
  end;;

parcoursPrefixe a;; print_newline();;
parcoursInfixe a;; print_newline();;
parcoursPostfixe a;; print_newline();;
