
list = [1,2,3]

IO.inspect Enum.map(list, fn(num) -> num + 3 end)