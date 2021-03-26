# control structures

## if and unless

In Elixir, if and unless are macros and not language constructs. This means that they are calculated and are units of code that work in the background at the kernel level. We don't have to worry about what this means, other than that if statements work differently and are more efficient than other languages.

Like Ruby, the only falsey values are nil and false.

```bash

iex> if String.valid?("hellow") do
        "valid"
    else
        "invalid"
    end

```

This means the use of predicates is very important in if statments rather than mathematical equations.

Unless works the same way as Ruby and is basically the inverse of if. No need to do if nots in Elixir!!!


## case statements

In Elixir, case statements work the same way as other languages. However, they always require a default that is done by using the underscore character. Cases are used when we need to match agains multiple patterns.


```bash

num = 3

iex> case num do
    1 -> IO.puts "you got 1"
    2 -> IO.puts "you got 2"
    _ -> IO.puts "No number for you"
    end

```

Cases will essentially do a match on each pattern supplied. If you don't want the value to be reassigned inside the case, as it will create a different world, you should use the pin operator as before.


We can also use guard clauses with the when keyword inside of case statements

```bash

iex> case {1, 2, 3} do
        {1, x, 3} when x > 0 -> "Will match"
        _ -> "won't match"
     end

```

## cond

This is much more familiar territory. Cond will match on condtions rather than values. Basically, if if statements and case statements had a baby, these would be conds in Elixir.

```bash

iex> cond do
    2 + 2 == 5 -> "This will not be true"
    2 * 2 == 3 -> "Nor this"
    1 + 1 == 2 -> "But this will"
    true -> "this will always return if there is no match"
end

```

in cond statements, we can use a true boolean to return the default case.



## with

Will need to revisit with in more detail. But, what it allows is a right side comparison to verify the shape of a comparison is the same. They can essentially function like guard clauses. This snippit kinda shows how they can work


```bash

greetings = %{first: "hi", second: "hellow"}

with {:ok, greeting} <- Map.fetch(greetings, :third) do IO.inspect greeting 
  else 
    _ ->
      IO.puts "what is this"
    
end


```

What I think is going on here is that the tuple with the :ok atom and greeting shows the shape of the return and the value we want to assign the result of the Map.fetch function. Once this evaluates, it then runs the do block. We can use an else in here to catch other cases.





