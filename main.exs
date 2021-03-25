greeting = "howdy"

say_hello = fn(^greeting, name) -> IO.puts "#{greeting} #{name}" end

say_hello.("howdy", "Ed")
