# modules

Modules are the same concept in Elixir as in other languages. We can package code into reusuable units to be used in other files easier. This is done with the defmodule keyword and is required to have named functions in code. We can complie these directly by using the elixir command and the file name within an iex session.

```bash

iex> elixir main.exs // => modules will appear as stdout and can be called within the iex session

```

Consider the below module definition.

```bash

defmodule MyModule do
    def my_function(arg) do
        arg
    end

end

iex> MyModule.my_function(arg) // => arg

```

With the above, once loaded into the iex session, we can use the syntax MyModule.my_function(arg) to run the function in the iex session or outside of the module definition.

## module attributes

as Elixir is a functional language, there are no classes. Instead, modules behave as the building blocks of code. So, these can have their own attributes. These are done in a very similar way to Ruby instance methods.

```bash

def MyModule do
    @foo "bar"

    def my_function() do
        @foo
    end

end

```

The above function will allow us to expose the module attribute in a function call. Note the lack of an equals sign here. We are not assigning this as a variable. We are instead making a reference to a piece of the module.

## comments

We can do comments like ruby with the # symbol. Multi line comments do not exist in elixir and we instead use the @moduledoc or @doc decorators followed by triple quotes to wrap the block.

```bash

def MyModule do
    @moduledoc"""
    module description goes here

    """

    @doc"""
    function description goes here
    """
    def my_function do

    end

end


```

## structs

Structs are essentially interfaces in the functional world. They can only be used inside module definitions and take the name of it impliciltly. 

consider the below code block


```bash

defmodule Example.User do
  defstruct name: "Sean", roles: []
end


iex> %Example.User{}
%Example.User<name: "Sean", roles: [], ...>

iex> %Example.User{name: "Steve"}
%Example.User<name: "Steve", roles: [], ...>

iex> %Example.User{name: "Steve", roles: [:manager]}
%Example.User<name: "Steve", roles: [:manager]>

```

What is happening here is that the struct is showing us the shape of any Example.User capture. We can then create new maps of the shape of the struct by using the module name as above. These functionally work in the same was as classes in other languages. There isn't really need for vanilla getters either as dot notation for accessing works just fine. But, we can do this really simply by using a named function and passing in a filler argument. Best practice is to use this, but anything will work.


```bash

defmodule Character do
  defstruct name: "ed", age: 27

  def say_name(this) do
    this.name
  end
end


```

These then work exactly like maps for the purposes of updating and deleting. We also have access to a nifty function called inspect. This lets us see the struct as a whole. Returning what is basically it's definition.

If we want properties to remain private on the struct, we can use the @derive attribute and pass a list in a similar way to ruby's meta programming syntax.


```bash

defmodule Character do
    @derive {Inspect, only:[:name]}

  defstruct name: "ed", age: 27

  def say_name(this) do
    this.name
  end
end

```

This functions very similarly to the private syntax in other languages.


## composition

Composition of Elixir programs is really important as the trailing module names can become quite cumbersome. Let's look at ways to manage this.

### alias

```bash

defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Example do
  alias Sayings.Greetings as: G

  def greeting(name), do: G.basic(name)
end

```

In the module definition, include the alias keyword and the module itself. You can then use the as: syntax to name the alias. We can also alias multiple modules at once. In this instance, the module name after the last dot is what is used as the name.

```bash

defmodule Example do
  alias Sayings.{Greetings, Farewells}
end

```


### import

If we just want to import the functions rather than the whole module, we can use the import syntax. We can then also use the only: syntax to grab the function by name and arity.

```bash

iex> import List, only: [last: 1]
iex> first([1, 2, 3]) // => (CompileError) iex:13: undefined function first/1
iex> last([1, 2, 3]) // => 3

```

This means we can keep our compiled sizes small by only grabing functions we actually want in our code. We can also use the except: syntaxt to exclude functions in exactly the same way as above.

There are also atoms that exist to import macros of functions only. These are :macros and :functions respectively.



### require

require works the exact same way as import, but only does this for macros. If we try to use a function from the module, it will not work and raise an error.


### use

Now this is pod racing. Use is like super() in the OO world. It update the definition of the module with the thing that is passed to it. What is actually happeneing is that the module is writing a new definition via a macro. See below:


```bash

defmodule Hello do
  defmacro __using__(_opts) do
    quote do
      def hello(name), do: "Hi, #{name}"
    end
  end
end

```

The above is what is needed inside the 'parent' module in order for use to work. Without this callback, the use in the 'child' module will not work at all.

Now:

```bash

defmodule Example do
  use Hello
end

```

The above module can use the use macro as expected and get a result. We can then allow for a similar thing to method overloading from Java by utilising the opts as above. See below the new example.


```bash

defmodule Hello do
  defmacro __using__(_opts) do
    greeting = Keyword.get(opts, :greeting, "hi")
    quote do
      def hello(name), do: unquote(greeting) <> ", " <> name
    end
  end
end


```

This then will allow for an option to be passed into the greeting function within the 'child' module.

```bash

defmodule Example do
  use Hello, greeting: "Hola"
end


```

This can also be used with the keyword argument passed easy enough. Truly a useful feature to write into our modules.