
###
This test module is responsible
for testing everything that
is inside the Pagy.Main module.
###

main = new Pagy.Main
dictionary = Pagy.Dictionary
fakeBrowser = PagyTests.FakeBrowserFacade


module "main",
  setup: () ->
    $div = $ "#qunit-fixture > .sandbox > div"
    main.init $div


getSandboxDiv = () ->
  $ "#qunit-fixture > .sandbox > div"


###
Test for the initialization process. Assures
that the basic elements are created.
###
test "init", () ->

  $div = getSandboxDiv()
  
  ok ($div.is ".pagy"), "should add pagy class"
  ok ($div.find ".menu").length > 0, "should add pagy menu element"
  ok ($div.find ".viewport").length > 0, "should add pagy viewport element"


###
Tests the autoinit feature.
###
test "autoinit", () ->
  $div = $ "#qunit-fixture > .autoinit div"
  ok ($div.is ".pagy"), "should auto initialize div"
  
  