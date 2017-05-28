VER=0.21

default: help

help:
	@echo -e "Select a sub command \n"
	@echo -e "install-hugo: \n\t Download and install hugo"
	@echo -e "sync: \n\t Pull submodules"
	@echo -e "view: \n\t Serve site in local"
	@echo -e "publish: \n\t Generate website"
	@echo -e "\n"
	@echo -e "See README.md for more."

install-hugo:
	curl -sSL -o /tmp/hugo.tar.gz \
		https://github.com/spf13/hugo/releases/download/v${VER}/hugo_${VER}_Linux-64bit.tar.gz
	tar -xzf /tmp/hugo.tar.gz -C /usr/local/bin/
	rm /tmp/hugo.tar.gz

sync:
	git submodule update --init --recursive

view:
	hugo server --bind=0.0.0.0 --baseURL=http://0.0.0.0:1313/ ./

publish:
	hugo -b https://fanach.github.io/ -d fanach.github.io
