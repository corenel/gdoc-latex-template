all:
	xelatex main.tex && bibtex main.aux && xelatex main.tex && xelatex main.tex

docx:
	pandoc -s thesis.tex -o thesis.docx

clean:
	find -E . -type f -iregex '.*\.(aux|log|toc|backup|acr|brf|gz|acn|xdy|alg|fdb_latexmk|fls|out|xdv|blg|bbl)$$'  -delete

clean_alt:
	find . -type f -iregex '.*\.\(aux\|log\|toc\|backup\|acr\|brf\|gz\|acn\|xdy\|alg\)$$'  -delete
