type arbre_binaire = 
  | Vide
  | Noeud of arbre_binaire * int * arbre_binaire;;

Noeud(
  Vide,
  3,
  Noeud(
    Noeud(Vide, 7, Vide),
    5,
    Noeud(
      Noeud(Vide, 4, Vide),
      9,
      Noeud(
        Noeud(Vide, 1, Vide),
        2,
        Noeud(Vide, 6, Vide)
      )
    )
  )
);;
