
main = new Main

test "init", () ->
  
  $div = $ "#qunit-fixtures > .init div"
  
  main.init $div
  
  ok ($div.is ".pagy"), "added pagy class"
  ok ($div.find ".pagy-menu").length > 0, "added pagy menu element"
  ok ($div.find ".pagy-viewport").length > 0, "added pagy viewport element"
  
test "autoinit", () ->
  $div = $ "#qunit-fixtures > .autoinit div"
  ok ($div.is ".pagy")