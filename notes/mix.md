# Mix

Now, the bit I've been waiting for. Mix is RubyGems, Bundler, and Rake all rolled into one. Basically like Poetry for Python that I really like.

To create a new project, we can use the following:

```bash
mix new project-name

```

This then outputs the following files in the directory the above was called:

* creating README.md
* creating .formatter.exs
* creating .gitignore
* creating mix.exs
* creating lib
* creating lib/example.ex
* creating test
* creating test/test_helper.exs
* creating test/example_test.exs

Looking at the mix.exs file:

```bash

defmodule Example.MixProject do
  use Mix.Project

  def project do
    [
      app: :example,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    []
  end
end

```

Some bits of this are very obvious, others not so much. Project is where we define the name of the app this needs to be an atom. version and elixir are the versions of the app and elixir. Start-perm is the way to start the app correctly and the deps are dependencies for the prod env.

Def application is for when the app is run and will run other applications that are needed like the logger in the above example and the defp deps is the dev dependencies only.


### interactive

We can start an interactive session with our apps context with the following:

```bash
$ cd example
$ iex -S mix

```

Very useful to play about with stuff written in context.


## compilation

Mix is smart and will compile changes for us. But explicit compilation can be done with the mix compile command.

Once this is run, it will generate a lib dir with the compiled ex project file and then a build dir with our compiled app inside.