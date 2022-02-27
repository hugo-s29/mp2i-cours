from .kholle_loader import load_kholles
from .kholle_manager import KholleManager
from .kholle import Kholle

maths = load_kholles("Mathématiques", "maths.csv", abbr="Maths.")
physique = load_kholles("Physique", "physique.csv")
anglais = load_kholles("Anglais", "anglais.csv")
informatique = load_kholles("Informatique", "informatique.csv", abbr="Info.")
