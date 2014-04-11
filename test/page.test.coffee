
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


###
Test remove row behavior
###
test "remove row", () ->
  view = new Pagy.PageView
  model = view.model
  rows = model.get "rows"
  row = rows[0]
  row.trigger "remove"
  rows = model.get "rows"
  ok rows.length == 0, "should remove the row"
  
