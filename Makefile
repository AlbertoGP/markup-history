# Run landslide to output on http://localhost:8000

.PHONY: default
default: html slides

.PHONY: slides
slides:
	landslide -i markup-history.rst presentation.html

.PHONY: watch
watch:
	echo 'Watching for changes to markup-history.rst'
	landslide -i -w markup-history.rst presentation.html

.PHONY: html
html:
	rst2html.py README.rst README.html
	rst2html.py markup-history.rst markup-history.html
	rst2html.py notes-per-slide.rst notes-per-slide.html
	rst2html.py markup-history-extended-notes.rst markup-history-extended-notes.html

.PHONY: clean
clean:
	rm -f README.html
	rm -f presentation.html
	rm -f markup-history.html
	rm -f notes-per-slide.html
	rm -f markup-history-extended-notes.html
	rm -rf slides
	rm *~

.PHONY: help
help:
	@echo 'make         same as: make html slides'
	@echo 'make slides  create slideshow as presentation.html'
	@echo 'make watch   watch markup-history.rst for changes'
	@echo 'make html    create HTML files using rst2html'
	@echo 'make clean   delete HTML files and slides/'
