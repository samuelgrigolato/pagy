
###
This module is responsible
for testing the row module
###


dictionary = Pagy.Dictionary


module "row"


###
Test the existance of the button
container inside this row
###
test "controls container", () ->
  view = new Pagy.RowView
  $el = view.$el
  
  $controls = $el.find " > .controls "
  ok $controls.length == 1, "should have a control container"
  
  $addRowAbove = $controls.find " > .add-row.above "
  ok $addRowAbove.length == 1, "should have an add row above button"
  expectedCaption = dictionary.giveMe "addRowAboveCaption"
  ok $addRowAbove.text() == expectedCaption, "add row above caption should be '#{expectedCaption}'"
  
  $addRowBelow = $controls.find " > .add-row.below "
  ok $addRowBelow.length == 1, "should have an add row below"
  expectedCaption = dictionary.giveMe "addRowBelowCaption"
  ok $addRowBelow.text() == expectedCaption, "add row below caption should be '#{expectedCaption}'"
  

###
Test if clicking the button "add row below"
raises an event
###
test "add row below", () ->
  view = new Pagy.RowView
  model = view.model
  $el = view.$el
  $addRowBelow = $el.find "button.add-row.below"
  
  observations = 0
  observer = () ->
    observations++
  model.on "addRowBelow", observer
  
  $addRowBelow.trigger "click"
  ok observations == 1, "should have raised an 'addRowBelow' event"
  

###
Test if clicking the button "add row above"
raises an event
###
test "add row above", () ->
  view = new Pagy.RowView
  model = view.model
  $el = view.$el
  $addRowAbove = $el.find "button.add-row.above"
  
  observations = 0
  observer = () ->
    observations++
  model.on "addRowAbove", observer
  
  $addRowAbove.trigger "click"
  ok observations == 1, "should have raised an 'addRowAbove' event"
  

