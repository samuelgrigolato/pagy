
###
This module is responsible
for testing the column module
###


dictionary = Pagy.Dictionary


module "column"


###
Test the existance of the button
container inside the column
###
test "controls container", () ->
  view = new Pagy.ColumnView
  $el = view.$el
  
  $controls = $el.find " > .controls "
  ok $controls.length == 1, "should have a control container"
  
  $removeButton = $controls.find " > button.remove "
  ok $removeButton.length == 1, "should have a remove column button"
  
  $addRowButton = $controls.find " > button.add-row "
  ok $addRowButton.length == 1, "should have an add row button"


###
Test the remove column button behavior 
###
test "remove button", () ->
  view = new Pagy.ColumnView
  model = view.model
  
  $el = view.$el
  $controls = $el.find " > .controls "
  $removeButton = $controls.find " > button.remove "
  
  observations = 0
  model.on "remove", () ->
    observations++
  
  $removeButton.click()
  
  ok observations == 1, "should raise remove column event"
  
  
###
Test the add row button behavior
###
test "add row", () ->
  view = new Pagy.ColumnView
  
  $el = view.$el
  $controls = $el.find " > .controls "
  $addRowButton = $controls.find " > button.add-row "
    
  $addRowButton.click()
  
  $rows = $el.find " > .contents > .row "
  ok $rows.length == 2, "should create two initial rows"
  
  $addRowButton.click()
  
  $rows = $el.find " > .contents > .row "
  ok $rows.length == 3, "should create a third row"


###
Test remove row behavior
###
test "remove row", () ->
  view = new Pagy.ColumnView
  model = view.model
  model.addRow() # this operation adds 2 rows
  rows = model.get "rows"
  row = rows[0]
  row.trigger "remove"
  rows = model.get "rows"
  ok rows.length == 0, "should remove the rows"
  
    