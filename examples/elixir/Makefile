.PHONY: all clean deps run
all: clean deps run

hut_dir 			= $(shell cd ../../ ; pwd)

clean:
	mix do clean, deps.clean --all

deps:
	mix deps.get

run:
	elixir -pz $(hut_dir)/ebin -S mix run -e HutExampleElixir.start
