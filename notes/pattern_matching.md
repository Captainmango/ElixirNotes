# pattern matching

In Elixir we can match on values, data structures and functions. Unlike other languages, the signature of the inputs is what matters, not the outputs once evaluated.

This is a very strange part of Elixir, the single = sign is the match operator. It is very different from other languages as the left side is matched to the right side and returned only if the match is true. If it isn't, then a MatchError is thrown.

```bash

iex> 1 = x // => 1

iex> 2 = x // => MatchError

```

This can cause some unexpected assignment behaviour. The main thing to remember is that the match operator will assign if the variable is on the left hand side. It will also update definitions as expected in other languages. For example, if a list variable is declared and assigned, then assigned a new value later on, the new value wins.

```bash

iex> list = [1,2,3] // => [1,2,3]
IO.inspect list // => [1,2,3]

iex> list = [2,3,4] // => [2,3,4]
IO.inspect list // => [2,3,4]

```

As matching is done with a single equals, accidentla assignment can happen. The way to stop this is with the pin operator ^

```bash

iex> list = [1,2,3] // => [1,2,3]

iex> ^list = [2,3,4] // => MatchError

```

The pin operator can also be used in function definitions. By doing this, the variable utilised in the function is the one declared in the outside world by default. If the value doesn't match this, the function will throw a FunctionClauseError.


```bash

greeting = "howdy"

say_hello = fn(^greeting, name) -> IO.puts "#{greeting} #{name}" end 

say_hello.("hello", "Ed") // => FunctionClauseError
say_hello.("howdy", "Ed") // => "howdy Ed"

```

This allows us to give functions signatures and have them only except arguments we expect.

