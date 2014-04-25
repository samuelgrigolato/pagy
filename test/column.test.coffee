
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


###
Test nesting level behavior
###
test "nesting level", () ->
  
  model = new Pagy.ColumnModel { level: Pagy.ColumnModel.MAX_LEVEL }
  view = new Pagy.ColumnView { model: model }
  
  $el = view.$el
  $controls = $el.find " > .controls "
  $addRowButton = $controls.find " > button.add-row "
  
  ok ($addRowButton.is ".hidden"), "should hide add row button"
  
  model = new Pagy.ColumnModel { level: 2 }
  model.addRow()
  rows = model.get "rows"
  row = rows[0]
  rowLevel = row.get "level"
  ok rowLevel == 3, "should increment children's level"


###
Test last column behavior
###
test "last column", () ->
  
  model = new Pagy.ColumnModel { last: true }
  view = new Pagy.ColumnView { model: model }
  $el = view.$el
  ok $el.is(".last"), "should add last class"

###
Test not empty behavior
###
test "not empty", () ->
  
  view = new Pagy.ColumnView
  $el = view.$el
  ok $el.is(".empty"), "should have empty class"
  ok $el.is(":not(.not-empty)"), "should not have not empty class"
  model = view.model
  model.addRow()
  ok $el.is(":not(.empty)"), "should remove empty class"
  ok $el.is(".not-empty"), "should add not empty class"

