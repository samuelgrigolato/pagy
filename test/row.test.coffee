
###
This module is responsible
for testing the row module
###


dictionary = Pagy.Dictionary


module "row"


###
Test the existance of the button
container inside the row
###
test "controls container", () ->
  view = new Pagy.RowView
  $el = view.$el
  
  $controls = $el.find " > .controls "
  ok $controls.length == 1, "should have a control container"
  
  $removeButton = $controls.find " > button.remove "
  ok $removeButton.length == 1, "should have a remove row button"
  
  $addColumnButton = $controls.find " > button.add-column "
  ok $addColumnButton.length == 1, "should have an add column button"


###
Test the remove row button behavior 
###
test "remove button", () ->
  view = new Pagy.RowView
  model = view.model
  
  $el = view.$el
  $controls = $el.find " > .controls "
  $removeButton = $controls.find " > button.remove "
  
  observations = 0
  model.on "remove", () ->
    observations++
  
  $removeButton.click()
  
  ok observations == 1, "should raise remove row event"
  
  
###
Test the add column button behavior
###
test "add column", () ->
  view = new Pagy.RowView
  
  $el = view.$el
  $controls = $el.find " > .controls "
  $addColumnButton = $controls.find " > button.add-column "
    
  $addColumnButton.click()
  
  $columns = $el.find " > .contents > .column "
  ok $columns.length == 2, "should create two initial columns"
  
  $addColumnButton.click()
  
  $columns = $el.find " > .contents > .column "
  ok $columns.length == 3, "should create a third column"
  
    