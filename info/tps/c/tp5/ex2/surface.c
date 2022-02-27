#include<math.h>

double rectangle(double largeur, double longueur) {
  return largeur * longueur;
}

double disque(double rayon) {
  return M_PI * rayon * rayon;
}

double enveloppeCylindre(double rayon, double hauteur) {
  return M_PI * 2 * rayon * hauteur;
}