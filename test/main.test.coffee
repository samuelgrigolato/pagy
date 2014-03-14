
main = new Main

test "init", () ->
  
  $div = $ "#qunit-fixtures > .init div"
  
  main.init $div
  
  ok ($div.is ".pagy"), "should pagy class"
  ok ($div.find ".pagy-menu").length > 0, "should add pagy menu element"
  ok ($div.find ".pagy-viewport").length > 0, "should add pagy viewport element"
  
test "autoinit", () ->
  $div = $ "#qunit-fixtures > .autoinit div"
  ok ($div.is ".pagy"), "should auto initialize div"