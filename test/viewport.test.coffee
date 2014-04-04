
###
This module is responsible for
testing the application viewport
###


module "viewport",
  setup: () ->


###
Test the existance
of a page div
###
test "page div", () ->
  view = new Pagy.ViewportView
  $el = view.$el
  $pageDiv = $el.find " > div.page "
  ok $pageDiv.length == 1, "should have a page div"


###
Test the initial model
by checking if the
first single row exists
###
test "first row", () ->
  view = new Pagy.ViewportView
  $el = view.$el
  $firstRow = $el.find " div.page > div.row "
  ok $firstRow.length == 1, "should have a single row"
  
  
###
Test if changing the viewport
mode changes also its page's
###
test "should propagate mode change", () ->
  view = new Pagy.ViewportView
  model = view.model
  model.set "mode", "preview"
  page = model.get "page"
  pageMode = page.get "mode"
  ok pageMode == "preview", "page's mode should be preview"


###
Test if the active mode is
visible as a viewport css class
###
test "should add active mode class", () ->
  view = new Pagy.ViewportView
  model = view.model
  $el = view.$el
  ok ($el.is ".layout-mode"), "should have active mode css class"
  model.set "mode", "preview"
  ok (!$el.is ".layout-mode"), "should remove layout css class"
  ok ($el.is ".preview-mode"), "should add preview css class"

