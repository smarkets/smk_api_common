.PHONY: deps

VSN="dev"
NAME="smk_api_common-$(VSN)"

deps:
	./rebar get-deps update-deps

proto: deps
	piqi to-proto -I deps/eto_common/ \
		seto.piqi -o seto.proto

docs: deps
	cd deps/smk_api_docs/ && \
		make

buildclean:
	rm -rf build

all: proto docs buildclean
	mkdir -p build
	cp seto.piqi build/
	cp seto.proto build/
	cp -r deps/smk_api_docs/build build/docs

dist: all
	cp -rf build $(NAME)
	tar -zcf $(NAME).tar.gz $(NAME)
	rm -rf $(NAME)
