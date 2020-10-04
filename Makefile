.PHONY: clean make healthcheck

make:
	@dot -Tpng -o ex2.png < ex2.txt
	@cat ex3.txt | java -jar ~/plantuml.jar -pipe > ex3.png
	@pdflatex main.tex >> /dev/null

clean:
	@rm -f *.png *.aux *.log *.gz *.toc *.dvi *.pdf

clean_for_first_push:
	@rm -f *.png *.aux *.log *.gz *.toc *.dvi

healthcheck:
	@if which latex &> /dev/null ; then true ; else echo "I require latex but it's not installed."; fi
	@if which pdflatex &> /dev/null ; then true ; else echo "I require pdflatex but it's not installed." ; fi
	@if which dot &> /dev/null ; then true ; else echo "I require dot and GraphViz but it's not installed." ; fi
	@if which java &> /dev/null ; then true ; else echo "I require java but it's not installed." ; fi
	@if which plantuml &> /dev/null ; then true ; else echo "I require plantuml but it's not installed." ; fi
