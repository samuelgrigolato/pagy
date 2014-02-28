
main = new Main

test "square", () ->
  ok (main.square 3) == 9, "square of 3 = 9"
  ok (main.square 4) == 16, "square of 4 = 16"