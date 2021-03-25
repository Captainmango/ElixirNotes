# Collections

## Lists

In Elixir, square brackets denote a linked list NOT an array. Normal linked list rules apply here and in Elixir they can contain multuple types of data.

```bash

iex> list = [3.14, "test", 3] // => [3.14, "test", 3]

```

prepending elements is done with the following. List variable is as above:

```bash
iex> ["n" | list] // => ["n", 3.14, "test", 3]


```

Appending elements is done with the following. List variable is as above:

```bash

iex> list ++ ["n"] // => [3.14, "test", 3, "n"]

```

You can can concatenate 2 lists together using the above syntax too. This is slow from a time complexity perspective as the entire structure will need to be traversed.

A cool feature in Elixir is that you can subtract from lists. The syntax is the following:

```bash

iex> [3.14, "test", 3, "n"] -- ["n"] // => [3.14, "test", 3]

```

Be aware though, this uses strict comparison on an item wise basis and will select the first match it comes across.

### methods

We have head and tail methods. These will return the first and all elements except the first of the linked list respectively.

We also have access to pattern matching and can follow a very similar pattern to JS destructuring. See the below:

```bash

iex> [head | tail] = [3.14, :pie, "Apple"]

iex> head // => 3.14

iex> tail // => [:pie, "Apple"]

```

## Tuples

Tuples are like lists but are stored contiguously, like arrays in other languages. This is created using curly braces. Consider the below:

```bash

iex> my_array = {1,2,3}

```

It's common practise for tuples to be used to return addtional info from functions. Similar to objects but with more flexibility in the return.


## Keyword Lists

Keyword lists are an associative type in Elixir. That is, they can contain key value pairs and the values can be accessed by using the key. The key is always an atom. The keys are ordered and they do not have to be unique. A common use of these is to use keyword lists to pass options to functions.

```bash
iex> [foo: "bar", test: "123"]

```


## Maps

Maps are the go to associative type in Elixir. Unlike keyword lists, they are un ordered and allow any type when creating a key. This is closest to dictionaries and hashes in Ruby and Python. They are created by using the %{} syntax

```bash
iex> my_map = %{:foo => "bar"} // => %{:foo => "bar"}

iex> my_map[:foo] // => "bar"

```

We can also use variables as key values. This will insert the value into the map rather than the reference. If a duplicate key is added, the old key and value will be updated as normal.

We can access atom keys by using dot notation, just like Ruby. But, there is a unique way for maps to be updated in Elixir. Consider the below:

```bash
iex> my_map = %{ :foo => "bar" }

iex> %{my_map | foo: "bizz" } // => %{:foo => "bizz"}

```

if the key isn't present in the map, this will through a key error rather than adding the key so be careful. To add a new key value pair to an existing map, use the put method. See below:

```bash

iex> my_map = %{:foo => "bar"}

iex> Map.put(my_map, laa:, "boo") // => %{ :foo => "bar", :laa => "boo" }

```

