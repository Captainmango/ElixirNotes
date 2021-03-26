# pipe operator

The pipe operator is like the tap method or the .then promise syntax from ruby and JS respectively. They allow us to run functions on the output of one function after the other. It allows for very tidy syntax within function definitions.

The one key thing to remember is that arguments on successive pipe operators need to be wrapped in parantheses. This is a best practice thing, but is something the compiler will get upset about so be mindful.

```bash

iex> "foo" |> String.ends_with("oo") // => true

```