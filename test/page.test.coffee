
###
This module is responsible for testing
the page module
###


dictionary = Pagy.Dictionary


module "page"


###
Test if the page starts
with a single row
###
test "starts with a single row", () ->
  view = new Pagy.PageView
  $el = view.$el
  $row = $el.find " > div.row "
  ok $row.length == 1, "should start with a single row"


###
Test if the add row button exists
###
test "add row button appearance", () ->
  view = new Pagy.PageView
  $el = view.$el
  $button = $el.find " > button.add-row "
  ok $button.length == 1, "should have an add row button"
  expectedCaption = dictionary.giveMe "addRowButtonCaption"
  ok ($button.text() == expectedCaption), "button should have the caption '#{expectedCaption}'"
  

###
Test the add row
button behavior
###
test "add row button behavior", () ->
  view = new Pagy.PageView
  $el = view.$el
  $button = $el.find " > button.add-row "
  $button.click()
  $rows = $el.find " > div.row "
  ok $rows.length == 2, "should add a new row"
