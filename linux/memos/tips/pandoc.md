# Pandoc

Pandoc permet de convertir des fichiers Markdown, LaTeX ou encore docx en PDF.

* **Convertir md vers pdf**
	```
	$ pandoc -s -V geometry:margin=1in -o fichier-a-sortir.pdf fichier-a-convertir.md
	```
	L'option **-V** permet de réduire la taille de la marge qui est très imposante sans cette option.