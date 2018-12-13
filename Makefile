PROJECT = hut
PROJECT_DESCRIPTION = helper library for making Erlang libraries logging framework agnostic
PROJECT_VERSION = 1.3.0

ifneq (,$(filter $(shell uname -s),FreeBSD DragonFly))
make = gmake
else
make = make
endif

ci:: all
	cd examples/basic && $(make) run_example_default
	cd examples/basic && $(make) run_example_sasl
	cd examples/basic && $(make) run_example_default_no_gate
	cd examples/basic && $(make) run_example_default_debug_enabled
	cd examples/basic && $(make) run_example_default_warning_enabled
	cd examples/basic && $(make) run_example_noop
	cd examples/basic && $(make) run_example_ioformat
	cd examples/basic && $(make) run_example_custom
	cd examples/basic && $(make) run_example_lager
	cd examples/basic && $(make) run_example_lager_custom_sink

app:: rebar.config

include erlang.mk
