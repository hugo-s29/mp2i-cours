import hashlib
from unidecode import unidecode

name = input("> ")
name = unidecode(name)
name = name.encode("ascii", "replace")
print(name)

print(hashlib.sha256(name).hexdigest()[:16])
