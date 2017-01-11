.PHONY: deps clean

all: deps compile

compile:
	./rebar compile

deps:
	./rebar get-deps update-deps

clean:
	./rebar clean
