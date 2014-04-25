
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
  
    
###
Test remove column behavior
###
test "remove column", () ->
  view = new Pagy.RowView
  model = view.model
  model.addColumn() # this operation adds 2 columns
  columns = model.get "columns"
  column = columns[0]
  column.trigger "remove"
  columns = model.get "columns"
  ok columns.length == 0, "should remove the columns"

###
Test the behavior around the maximum
number of columns inside a row
###
test "maximum number of columns", () ->
  view = new Pagy.RowView
  model = view.model
  model.addColumn() # adds 2 columns
  model.addColumn() for i in [3..Pagy.RowModel.MAX_COLUMNS]
  $el = view.$el
  $controls = $el.find " > .controls "
  $addColumnButton = $controls.find " > button.add-column "
  ok $addColumnButton.is(".hidden"), "should hide the add column button"
  columns = model.get "columns"
  column = columns[0]
  column.trigger "remove"
  ok $addColumnButton.is(":not(.hidden)"), "should display the add column button again"


###
Test the propagation of row 
nesting level to column
###
test "nesting level", () ->
  model = new Pagy.RowModel { level: 3 }
  model.addColumn()
  columns = model.get "columns"
  column = columns[0]
  columnLevel = column.get "level"
  ok columnLevel == 3, "should propagate level to column"


###
Test column count row class
###
test "column count row class", () ->
  view = new Pagy.RowView
  $el = view.$el
  model = view.model
  model.addColumn()
  ok $el.is(".columns-2"), "should add columns-2 class"
  model.addColumn()
  ok $el.is(":not(.columns-2)"), "should remove columns-2 class"
  ok $el.is(".columns-3"), "should add columns-3 class"
  model.addColumn()
  ok $el.is(":not(.columns-3)"), "should remove columns-3 class"
  ok $el.is(".columns-4"), "should add columns-4 class"


###
Test last column behavior
###
test "last column", () ->
  view = new Pagy.RowView
  model = view.model
  model.addColumn()
  columns = model.get "columns"
  first = columns[0]
  last = columns[1]
  ok !(first.get "last"), "should not set first column"
  ok last.get "last", "should set last column"

