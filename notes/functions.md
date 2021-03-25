# functions

Elixir like other languages supports function definitions and anonymous functions.


## anonymous functions

To define an anonymous function, we can use the fn keyword. Although, this isn't really used that much as we have the capture operator which does this much quicker. The main thing to remember is that the capture operator needs to be prepended to arguments. If that isn't done, then the things inside the brackets are considered part of the function's world.

```bash

sum = &(&1 + 2)

```

as mentioned before, we can do pattern matching on function signatures. This allows us to ensure functions behave the way we expect.

```bash

what_is_the_result = fn
  {:ok, result} -> IO.inspect result
  {:error} -> IO.puts "this broke"
  end

var = 3

what_is_the_result.({:ok, var})

```

Note how the above snippit will match the input args and then execute the right side of the dash rocket.


## named functions

Named functions are done the same way as Ruby, with the def keyword and of course do end syntax. If we ever want to do things on one line, we can use a colon after the do. One main thing to note is that named functions can ONLY be defined in modules. See below example:

```bash

defmodule Test do
  
  def print_name(name), do: IO.puts name
end


```

Another key thing to remember is that named functions can share names, but not names and arity. So we can have multiple print_name functions like the above if their arity is different.


### named functions and pattern matching

Behind the scenes, functions are pattern matching arguments passed in. This means if we only want certain things to be passed into a function we can supply this in the definition itself. This means if the supplied argument isn't of the right shape, the functions doesn't execute and will throw a FunctionClauseError.

```bash

defmodule Greeter1 do
  def hello(%{name: person_name}) do
    IO.puts "Hello, " <> person_name
  end
end

```


## private functions

There is no private keyword in Elixir and there is instead the defp keyword. This allows us to define a private function. This means that the function is then only accessible within the module it is defined and cannot be used in another file if imported.




## guards

guards are done by using the when keyword in the definition and before the do keyword. We can have functions with the same name and different guards as they will trigger differently based on how the guards behave. Consider the below example:

```bash

defmodule Greeter do
  def hello(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello
  end

  def hello(name) when is_binary(name) do
    phrase() <> name
  end

  defp phrase, do: "Hello, "
end

```

The pipe and greater than symbol are like the then syntax in JS. The first def hello will only take a list of names, then join them into a string, then run the hello function that returns the phrase. The is_binary predicate is essentially detecting if the name is a string or something that can be appened to hello. As we mentioned before, strings and charlists are different, but boths should work in this function, which is why is_binary is used.

## default args

default arguments are done with a double \\ confusing I know!

to handle default args in multiple places, we can define a function head. We can do this by defining a named function and not supplying a do block.

```basb

defmodule Test do
  def print_name(name \\ "ed") 

  def print_name(name) do
    IO.puts(name) 
  end
end

a = fn() -> Test.print_name.() end
IO.inspect a.()


```

This for some reason is throwing a BadFunctionError. This is because of IO.puts. If I remove this then it will work as intended