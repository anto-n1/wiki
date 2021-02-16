# Redirections de sortie Linux

| FONCTION                                                                        | sh/bash     | zsh      |
|---------------------------------------------------------------------------------|-------------|----------|
| Rediriger sortie erreur (2) et sortie standard (1) sur entrée commande suivante | 2>&1 \|     | \|&      |
| Rediriger sortie erreur et sortie standard vers fichier                         | >file 2>&1  | >& file  |
| Rediriger sortie erreur et sortie standard fin de fichier                       | >>file 2>&1 | >>& file |