all:
	xelatex document.tex && bibtex document.aux && xelatex document.tex && xelatex document.tex

docx:
	pandoc -s document.tex -o document.docx

clean:
	find -E . -type f -iregex '.*\.(aux|log|toc|backup|acr|brf|gz|acn|xdy|alg|fdb_latexmk|fls|out|xdv|blg|bbl)$$'  -delete

clean_alt:
	find . -type f -iregex '.*\.\(aux\|log\|toc\|backup\|acr\|brf\|gz\|acn\|xdy\|alg\)$$'  -delete
