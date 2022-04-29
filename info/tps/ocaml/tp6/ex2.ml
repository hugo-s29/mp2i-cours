type nbr = 
  | Entier of int
  | Flottant of float
  | InfiniPositif
  | InfiniNegatif;;

let addition a b =
  match (a, b) with
    | (Entier a, Entier b) -> Flottant(float_of_int(a) +. float_of_int(b));
    | (Entier a, Flottant b) -> Flottant(float_of_int(a) +. b);
    | (Flottant a, Entier b) -> Flottant(float_of_int(b) +. a);
    | (Flottant a, Flottant b) -> Flottant(b +. a);
    | (Entier a, InfiniPositif) -> b;
    | (Entier a, InfiniNegatif) -> b;
    | (Flottant a, InfiniPositif) -> b;
    | (Flottant a, InfiniNegatif) -> b;
    | (InfiniPositif, Entier b) -> a;
    | (InfiniNegatif, Entier b) -> a;
    | (InfiniPositif, Flottant b) -> a;
    | (InfiniNegatif, Flottant b) -> a;
    | (InfiniPositif, InfiniPositif) -> a;
    | (InfiniNegatif, InfiniNegatif) -> a;
    | (InfiniPositif, InfiniNegatif) -> failwith("+∞ + -∞");
    | (InfiniNegatif, InfiniPositif) -> failwith("-∞ + +∞");;

