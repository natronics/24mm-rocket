FILES=$(shell find . -type d \( -path ./.git -o -path ./_site \) -prune -o -print)


all: _site

deploy: _site
	./deploy.sh

_site: $(FILES) index.md simulation/drawing.svg
	jekyll build

index.md: README.markdown
	echo "---\nlayout: article\ntitle: 24mm Rocket\n---\n\n" | cat - README.markdown > index.md

simulation/drawing.svg: simulation/24mm_minimum_dia.ork
	cd simulation; ./render.py > drawing.svg

clean:
	rm -rf _site/
	rm -f index.md
	rm -f simulation/*.svg
