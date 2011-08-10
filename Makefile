.PHONY: deps

VSN=dev
NAME=smk_api_common-$(VSN)

all: proto docs buildclean
	mkdir -p build/
	cp seto.piqi build/
	cp deps/eto_common/eto.piqi build/
	cp seto.piqi.proto build/
	cp -r deps/smk_api_docs/build build/docs

deps:
	./rebar get-deps update-deps

proto: deps
	piqi to-proto -I deps/eto_common/ \
		seto.piqi -o seto.piqi.proto

docs: deps
	cd deps/smk_api_docs/ && \
		make VSN=$(VSN)

buildclean:
	rm -rf build

distclean:
	rm -f *.tar.gz

dist: all
	cp -rf build "$(NAME)"
	tar -zcf "$(NAME).tar.gz" "$(NAME)"
	rm -rf "$(NAME)"
