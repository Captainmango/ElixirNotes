# Enumerable functions

The enum module is a collection of many functions used to work with enumerable types. All collections except tuples are enumerable.

Below are some of the most useful functions in this module and their usage

### all?

All will use the supplied function and apply it to each of the items in the enum. If any of these do not evaluate to true, the function will return false.

```bash

iex> Enum.all?([1,2,3,"4"], fn(item) -> Integer.is_even(item) end ) // => false

iex> Enum.all?([2,4,6,8], fn(item) -> Integer.is_even(item) end ) // => true

```

### any?

Works the same as the same as the above except if any of the items return true the function will return true

```bash

iex> Enum.any?([1,2,3,"4"], fn(item) -> Integer.is_even(item) end) // => true

```


### chunk_every

Breaks the supplied enumerable into chunks of the 2nd arguments size. Creates a nested structure within the current enum

```bash

Enum.chunk_every([1,2,3,4,5,6], 3) // => [[1,2,3],[4,5,6]]

```

### chunk_by

Works the same as above except you can supply a function to apply to each item to chunk the enum by.

```bash

Enum.chunk_by([1,2,3,4,5,6], fn(number) -> Integer.is_odd(number) end ) // => [[1,2],[3,4],[5,6]]

```


### map_every

Basically map, but we can supply a number of items to pass and a function to apply to the item it. It will always trigger on the first item in the enum and count from then on.

```bash

iex> Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end) // => [1001, 2, 3, 1004, 5, 6, 1007, 8]

```


### each

Same as Ruby each. Doesn't return a new array and carries out the provided function.



### map

Same as Ruby map. Returns a new enum once execution is done.

```bash

enum = [:ok, "test"]
IO.inspect Enum.map(enum, fn(item) -> item end)

```


### min

finds and returns the minimum value in a collection.

```bash

iex> Enum.min([1,2,3,4]) // => 1

```

### max

Same as above, but with max number.

```bash

iex> Enum.max([1,2,3,4]) // => 4

```

### filter

Same as Ruby select. Can supply a function to select items to keep in new collection. This does mutate the original collection

```bash

iex> Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end) // => [2, 4]

```


### reduce

Distils the enum to a single value. This works the same way as Ruby's reduce. Main difference is that an accumulator can be passed in to start the process. This is optional and if not passed, the first element is used instead.

```bash

iex> Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end) // => 16

```

### sort

Sort can be supplied 1 or 2 arguements. When supplied 1 it sorts the enum in ascending order. If 2, the second needs to be a function that is used to sort the items by.

```bash

iex> Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end) // => [%{val: 4}, %{val: 1}]

iex> Enum.sort([%{:count => 4}, %{:count => 1}]) // => [%{count: 1}, %{count: 4}]

```


### uniq

Works the same way as Ruby's uniq method. Removes duplicates from the enum




### uniq_by

Works the same way as Ruby's uniq_by method. Allows us to provide a function to do the uniqueness comparison.

```bash

iex> Enum.uniq_by([%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 3}], fn coord -> coord.y end) // => [%{x: 1, y: 1}, %{x: 3, y: 3}]

```


## the capture operator

We can use an & in place of the anonymous function def to capture and apply this within the enum functions. See the below example.

```bash

iex> plus_three = &(&1 + 3)

iex> Enum.map([1,2,3], plus_three) // => [4, 5, 6]

```

We assign the plus_three function to an anonymous function using the literal syntax. This would work within the context of the enum function, but is sytactically more complex than needed. There is similar behaviour in Ruby in which you can proc methods during the execution of another function by using the ampersand with a symbol. This is very similar. See below a Ruby-esque example of this:


```bash

iex> Enum.map([1,2,3], &Adding.plus_three(&1)) // => [4, 5, 6]

```

The main benefit to this is to achieve an even tidier syntax. See the belo example:


```bash

iex> Enum.map([1,2,3], &Adding.plus_three/1) // => [4, 5, 6]

```