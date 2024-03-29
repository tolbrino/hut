PROJECT = hut
PROJECT_DESCRIPTION = helper library for making Erlang libraries logging framework agnostic
PROJECT_VERSION = 1.4.0

ifneq (,$(filter $(shell uname -s),OpenBSD NetBSD FreeBSD DragonFly))
make = gmake
else
make = make
endif

examples_basic := \
	default \
	sasl \
	default_no_gate \
	default_debug_enabled \
	default_warning_enabled \
	noop \
	ioformat \
	custom \
	lager \
	lager_custom_sink

examples_rebar3 := \
	default \
	sasl \
	noop \
	lager

examples_elixir := \
	default \

ci:: test_examples_basic
ci:: test_examples_rebar3
ci:: test_examples_elixir

test_examples_basic:: all
	@echo "\n=== Run basic examples\n"
	cd examples/basic && $(foreach test,$(examples_basic), \
		echo "\n=== Run basic example: $(test)\n" && $(make) run_example_$(test) &&) \
		echo "\n=== Finished running basic examples\n"


test_examples_rebar3:: all
	@echo "\n=== Run rebar3 examples\n"
	cd examples/rebar3 && $(foreach test,$(examples_rebar3), \
		echo "\n=== Run rebar3 example: $(test)\n" && $(make) run_example_$(test) &&) \
		echo "\n=== Finished running rebar3 examples\n"

test_examples_elixir:: all
	@echo "\n=== Run elixir examples\n"
	cd examples/elixir && \
		echo "\n=== Run elixir example\n" && $(make) run && \
		echo "\n=== Finished running elixir example\n"


app:: rebar.config

include erlang.mk
