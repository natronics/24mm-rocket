FILES=$(shell find . -type d \( -path ./.git -o -path ./_site \) -prune -o -print)


all: _site

deploy: _site
	./deploy.sh

_site: $(FILES) index.md simulation/index.md
	jekyll build

index.md: README.markdown
	echo "---\nlayout: article\ntitle: 24mm Rocket\n---\n\n" | cat - README.markdown > index.md

simulation/index.md: simulation/24mm_minimum_dia.ork simulation/56-F31-12A_openrocketsim.csv simulation/index.ipynb
	jupyter nbconvert --execute --to=markdown --template="nb-markdown.tpl" simulation/index.ipynb

clean:
	rm -rf _site/
	rm -f index.md
	rm -f simulation/*.md
	rm -rf simulation/*_files
