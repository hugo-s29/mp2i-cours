type couleur = R | N;;

type arbreRN =
  | Vide
  | Noeud of arbreRN * int * couleur * arbreRN;;

(*1*)
Noeud(
  Noeud(
    Noeud(Vide, 12, R, Vide),
    22,
    N,
    Noeud(Vide, 27, R, Vide)
  ),
  32,
  N,
  Noeud(Vide, 62, N, Vide)
);;

(*2*)
Noeud(
  Noeud(
    Vide,
    30,
    N,
    Noeud(Vide, 30, R, Vide)
  ),
  40,
  N,
  Noeud(Vide, 60, N, Vide)
);;


