# testing

Unlike Ruby, Elixir comes with the testing framework packaged inside it. When a new mix project is created, the testing framework ExUnit is included and available to use out of the box.

## ExUnit

ExUnit includes all of the things needed to thoroughly test code. A very key thing to note is that test files need to be .exs files and that an entry point provided using the ExUnit.start() function. Out of the box, this will be done for us. But, be mindful of this and how it works.

Out of the box, a doctest is described in the test file so the mix test output will contain 2 tests, the one defined in the test file and the doctest passed.

## assert and refute

These are the macros that allow us to check expressions are true. Tests have the following syntax:

```bash

defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  test "greets the world" do
    assert Example.hello() == :word
  end
end

```

Just like a regular .ex file. The assert syntax is like a cond, unlike the matching we've been doing in the majority of the code so far. Assert enforces truthy, refute enforces falsey.


## assert_raise

This allows us to raise an error if the assert fails. This can be useful to signpost to other developers what is expected out of a certain test.


## assert_received

Not too sure how this works yet. But, it looks to allow us to enforce input into tests? The below snippit seems to show this:

```bash

defmodule SendingProcess do
  def run(pid) do
    send(pid, :ping)
  end
end

defmodule TestReceive do
  use ExUnit.Case

  test "receives ping" do
    SendingProcess.run(self())
    assert_received :ping
  end
end

```

We will have to delve into this more.


## capture_io and Capture_log


Something very new to me is the ability to capture an application's output within testing. To do this, we just need to pass the function into the capture_io macro that is generating the output.

```bash

defmodule OutputTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "outputs Hello World" do
    assert capture_io(fn -> IO.puts("Hello World") end) == "Hello World\n"
  end
end

```

capture_log does the same thing but for the logger application that runs on elixir applications.


## test setup

like Rspec, we can set up the inputs for the tests. We can do this with the setup_all macro, which takes a do block. We can then access the set up from within our tests.

```bash


defmodule ExampleTest do
  use ExUnit.Case
  doctest Example

  setup_all do
    {:ok, recipient: :world}
  end

  test "greets", state do
    assert Example.hello() == state[:recipient]
  end
end

```