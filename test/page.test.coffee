
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
