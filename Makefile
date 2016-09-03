FILES=$(shell find . -type d \( -path ./.git -o -path ./_site \) -prune -o -print)


all: _site

deploy: _site
	./deploy.sh

_site: $(FILES) index.md
	jekyll build

index.md: README.markdown
	echo "---\nlayout: article\ntitle: 24mm Rocket\n---\n\n" | cat - README.markdown > index.md

clean:
	rm -rf _site/
	rm -rf index.md
