
main = new Main

test "square", () ->
  ok (main.square 3) == 9, "square of 3 = 9"
  ok (main.square 4) == 16, "square of 4 = 16"
  
test "init", () ->
  $div = $ ".init-add-pagy-class div"
  main.init $div
  ok ($div.is ".pagy"), "added pagy class"