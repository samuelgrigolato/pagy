
main = new Pagy.Main
dictionary = Pagy.Dictionary
fakeBrowser = PagyTests.FakeBrowserFacade

test "init", () ->
  $div = $ "#qunit-fixtures > .sandbox > div"
  $div.empty()
  main.init $div
  
  ok ($div.is ".pagy"), "should pagy class"
  ok ($div.find ".menu").length > 0, "should add pagy menu element"
  ok ($div.find ".viewport").length > 0, "should add pagy viewport element"
  
test "autoinit", () ->
  $div = $ "#qunit-fixtures > .autoinit div"
  ok ($div.is ".pagy"), "should auto initialize div"
  
test "exit button", () ->
  $div = $ "#qunit-fixtures > .sandbox > div"
  $div.empty()
  main.init $div
  
  $button = $div.find "button.exit"
  
  ok $button.length > 0, "should have an exit button"

  expectedCaption = dictionary.giveMe "exitButtonCaption"
  ok ($button.text() == expectedCaption), "the caption should be '#{expectedCaption}'"
  
test "exit action", () ->
  $div = $ "#qunit-fixtures > .sandbox > div"
  $div.empty()
  main.init $div
  
  fakeBrowser.whenPromptedToConfirmReturn = false
  main.exitButton_onClick()
  ok !fakeBrowser.windowClosed, "should not close the window if the user cancels"
  
  fakeBrowser.whenPromptedToConfirmReturn = true
  main.exitButton_onClick()
  ok fakeBrowser.windowClosed, "should close the window if the user agrees"
  