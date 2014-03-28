
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
  
  ok ($div.is ".pagy"), "should pagy class"
  ok ($div.find ".menu").length > 0, "should add pagy menu element"
  ok ($div.find ".viewport").length > 0, "should add pagy viewport element"


###
Tests the autoinit feature.
###
test "autoinit", () ->
  $div = $ "#qunit-fixture > .autoinit div"
  ok ($div.is ".pagy"), "should auto initialize div"
  

###
Tests the exit button feature. Include an
assertion for the button caption.
###
test "exit button", () ->

  $div = getSandboxDiv()
  
  $button = $div.find "button.exit"
  ok $button.length > 0, "should have an exit button"
  
  expectedCaption = dictionary.giveMe "exitButtonCaption"
  ok ($button.text() == expectedCaption), "the caption should be '#{expectedCaption}'"


###
Tests the exit button event listener.
Use the fake browser to simulate user
behavior.
###
test "exit action", () ->

  $div = getSandboxDiv()
  
  fakeBrowser.whenPromptedToConfirmReturn = false
  main.exitButton_onClick()
  ok !fakeBrowser.windowClosed, "should not close the window if the user cancels"
  
  fakeBrowser.whenPromptedToConfirmReturn = true
  main.exitButton_onClick()
  ok fakeBrowser.windowClosed, "should close the window if the user agrees"
  
  