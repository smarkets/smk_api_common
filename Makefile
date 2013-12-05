.PHONY: deps proto clean

PIQI=deps/piqi/priv/piqi-binary/piqi

all: deps proto

deps:
	./rebar get-deps update-deps

proto:
	$(PIQI) to-proto -I deps/eto_common/ \
		seto.piqi -o seto.piqi.proto

clean:
	rm seto.piqi.proto
