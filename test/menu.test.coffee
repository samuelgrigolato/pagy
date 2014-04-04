
###
This test module is responsible
for testing the menu view.
###


module "menu",
  setup: () ->
    

initMenuView = () ->
  $div = $ "<div></div>"
  new Pagy.MenuView { $el: $div }
  

###
Tests the exit button feature. Include an
assertion for the button caption.
###
test "exit button", () ->

  view = initMenuView()
  $el = view.$el
  $button = $el.find "button.exit"
  
  ok $button.length > 0, "should have an exit button"
  
  expectedCaption = dictionary.giveMe "exitButtonCaption"
  ok ($button.text() == expectedCaption), "the caption should be '#{expectedCaption}'"


###
Tests the exit button event listener.
Use the fake browser to simulate user
behavior.
###
test "exit action", () ->

  view = initMenuView()
  $el = view.$el
  $button = $el.find "button.exit"
  
  fakeBrowser.whenPromptedToConfirmReturn = false
  $button.trigger "click"
  ok !fakeBrowser.windowClosed, "should not close the window if the user cancels"
  
  fakeBrowser.whenPromptedToConfirmReturn = true
  $button.trigger "click"
  ok fakeBrowser.windowClosed, "should close the window if the user agrees"


###
Tests the preview button. Whenever the user presses this
button the application should enter preview mode.
###
test "preview mode button", () ->

  view = initMenuView()
  $el = view.$el
  $button = $el.find "button.preview"
  
  ok $button.length > 0, "should have a preview button"
  
  expectedCaption = dictionary.giveMe "previewButtonCaption"
  ok ($button.text() == expectedCaption), "the caption should be '#{expectedCaption}'"


###
Tests the layout button. Whenever the user presses this
button the application should enter layout mode.
###
test "layout mode button", () ->

  view = initMenuView()
  $el = view.$el
  $button = $el.find "button.layout"
  
  ok $button.length > 0, "should have a layout button"
  
  expectedCaption = dictionary.giveMe "layoutButtonCaption"
  ok ($button.text() == expectedCaption), "the caption should be '#{expectedCaption}'"


###
Tests if the first activated mode is the
layout mode.
###
test "first active mode", () ->

  view = initMenuView()
  $el = view.$el
  $button = $el.find "button.layout"
  
  ok ($button.is ".pressed"), "the first active mode should be layout"
  

###
Tests if clicking the mode buttons does
switch the active one
###
test "switch mode", () ->

  view = initMenuView()
  $el = view.$el
  $buttonLayout = $el.find "button.layout"
  $buttonPreview = $el.find "button.preview"
  
  $buttonPreview.trigger "click"
  ok ($buttonPreview.is ".pressed"), "the preview mode should be active"
  ok ($buttonLayout.is ":not(.pressed)"), "the layout mode should not be active"
  
  $buttonLayout.trigger "click"
  ok ($buttonLayout.is ".pressed"), "the layout mode should be active"
  ok ($buttonPreview.is ":not(.pressed)"), "the preview mode should not be active"

