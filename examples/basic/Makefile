PROJECT 			= hut_example
PROJECT_DESCRIPTION = example of using various hut configurations
PROJECT_VERSION 	= 0.1.0

DEPS = lager
dep_lager_commit = 3.0.2

all:: run_example_basic

include ../../erlang.mk

hut_dir 			!= readlink -f `pwd`/../../
exec_run 			= hut_example
exec		 		= erl -pz ebin $(exec_opts) -run $(exec_run) -run init stop -noshell
erlc_includes 		= -pz $(hut_dir)

.PHONY: run_example_basic
run_example_basic: export ERLC_OPTS = $(erlc_includes)
run_example_basic: clean app
	$(exec)

.PHONY: run_example_error_logger
run_example_error_logger: export ERLC_OPTS = -DHUT_ERROR_LOGGER $(erlc_includes)
run_example_error_logger: clean app
	$(exec)

.PHONY: run_example_custom
run_example_custom: export ERLC_OPTS = -DHUT_CUSTOM -DHUT_CUSTOM_CB=$(PROJECT) $(erlc_includes)
run_example_custom: clean app
	$(exec)

.PHONY: run_example_none
run_example_none: export ERLC_OPTS = -DHUT_NONE $(erlc_includes)
run_example_none: clean app
	$(exec)

.PHONY: run_example_lager
run_example_lager: export ERLC_OPTS = -DHUT_LAGER +'{parse_transform, lager_transform}' $(erlc_includes)
run_example_lager: exec_opts = -run lager start
run_example_lager: clean app
	$(exec)

.PHONY: compile_example_elixir
compile_example_elixir: export ERLC_OPTS = -DHUT_ERROR_LOGGER $(erlc_includes)
compile_example_elixir: clean app
