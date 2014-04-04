
###
This module is responsible for testing
the page module
###


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
Test if adding a row above
and below works
###
test "add rows above and below", () ->
  view = new Pagy.PageView
  model = view.model
  startRows = model.get "rows"
  startRow = startRows[0]
  startRow.trigger "addRowAbove"
  ok (model.get "rows").length == 2, "should add row above"
  startRow.trigger "addRowBelow"
  ok (model.get "rows").length == 3, "should add row below"