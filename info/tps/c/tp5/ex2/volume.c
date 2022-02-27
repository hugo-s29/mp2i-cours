#include <math.h>
#include "surface.h"

double prisme(double largeur, double hauteur, double longueur) {
  return rectangle(largeur, hauteur) * longueur;
}

double cylindre(double rayon, double hauteur) {
  return disque(rayon) * hauteur;
}

double cone(double rayon, double hauteur) {
  return cylindre(rayon, hauteur) / 3.;
}

double sphere(double rayon) {
  return (4./3.) * M_PI * rayon * rayon * rayon;
}