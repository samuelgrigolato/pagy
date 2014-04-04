
###
This module is responsible for
testing the application viewport
###


module "viewport",
  setup: () ->
    
    
initViewportView = () ->
  $div = "<div></div>"
  new Pagy.ViewportView { $el: $div }
  

###
Test the existance
of a page div
###
test "page div", () ->
  view = initViewportView()
  $el = view.$el
  $pageDiv = $el.find " > div.page "
  ok $pageDiv.length == 1, "should have a page div"
  
###
Test the initial model
by checking if the
first single row exists
###
test "first row", () ->
  view = initViewportView()
  $el = view.$el
  $firstRow = $el.find " div.page > div.row "
  ok $firstRow.length == 1, "should have a single row"