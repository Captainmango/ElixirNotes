## Elixir Basics

> Repl.it playground [here](https://replit.com/@EdwardHeaver/LearningPlaygorund#main.exs)
> Elixir school link [here](https://elixirschool.com/en/)

If you want to play about in the shell, you can use iex, similarly to irb. ctrl + c is what gets you out

## basic data types

- integers => 23423
- floats => 23221.02
- booleans => true
- atoms => :foo
- strings => "foo bar"
- charlists => 'foo bar'

These types work very similarly to Ruby. Floats are 64 bit precesion and atoms are essentially symbols. Main difference here is that by default, an atom is equal to itself once declared. They can be the name for functions and can work in a similar way to Ruby symbols.


## arithmetic

normal operation rules work here. Exponent is different though. the :math.pow() function exists to handle smaller exponents. But, we would most likely need to implement this ourselves.

One major thing to note is that division using the / always returns a float value. To avoid this, we need to use the built in div() function.

the basic operations look like this:

2 + 2 // => 4

2 - 2 // => 0

2 * 2 // => 4

2 / 2 // => 1


### Booleans

Elixir supports pipes ampersands and bangs for boolean checks. One key thing to note is that variables are treated in a similar way to Ruby: only nil and false are falsey values. Everything else is truthy.

The operators look like this:

|| // => or

&& // => and

! // => negate or not

We can also use the keywords instead in a similar fashion to python.

#### Comparisons

Elixir supports comparisons in the same way as other languages. A key difference to Ruby is that strict comparison is done like JavaScript with triple equals sign.

An important feature of Elixir is that any two types can be compared; this is particularly useful in sorting. We don’t need to memorize the sort order, but it is important to be aware of it:

number < atom < reference < function < port < pid < tuple < map < list < bitstring

This can lead to some odd looking comparisons so watch out!!


### Strings

Strings work in a very similar way to Ruby. Interpolation is done with the #{} syntax

Concatenation is done with the <> angle brackets and goes in between 2 strings



