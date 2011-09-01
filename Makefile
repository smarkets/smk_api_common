.PHONY: deps

all: proto

deps:
	./rebar get-deps update-deps

proto: deps
	piqi to-proto -I deps/eto_common/ \
		seto.piqi -o seto.piqi.proto

github:
	git push origin github-master
	git push github github-master:master
	git tag v$(VSN)
	git push origin refs/tags/v$(VSN):refs/tags/v$(VSN)
	git push github refs/tags/v$(VSN):refs/tags/v$(VSN)
