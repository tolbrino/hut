Overview
--------

Hut is a header-only library for Erlang libraries and small applications to
stay agnostic to the logging framework in use. Its purpose is to allow the
developers of umbrella applications to use their logging framework of choice
and ensure that dependency stick to that choice as well.

Origin
------

The idea for Hut came out of [a
discussion](https://github.com/Feuerlabs/exometer_core/issues/57) about
[exometer_core](https://github.com/Feuerlabs/exometer_core)'s logging
facilities.

Usage
-----

1. Include Hut as a dependency in your toolchain.
2. Include Hut in your `.erl` files via `-include_lib(hut/include/hut.hrl)`
3. Log with
  - `?log(Level, Msg)` to log the given message
  - `?log(Level, Fmt, Args)` to format the given message with the arguments using `io_lib:format/2`
  - `?log(Level, Fmt, Args, Opts)` to pass additional options to the logging backend in use
4. Compile and pass the appropriate macro to the compiler to enable a certain backend as described next.

Supported Logging Backends
--------------------------

- `io:format/2` as the default
- no-op logging via `-DHUT_NONE`
- SASL error_logger via `-DHUT_ERROR_LOGGER`
- [Lager](https://github.com/basho/lager) via `-DHUT_LAGER`
- custom callback module via `-DHUT_CUSTOM -DHUT_CUSTOM_CB mycbmod` (the module must provide the function `log(Level, Fmt, Args, Opts)`

Examples
--------

Refer to the respective `Makefile` in each example for details.

- `examples/basic` shows the use of all backends from an Erlang library
- `examples/elixir` shows the using a Hut-enabled Erlang library within an Elixir application
