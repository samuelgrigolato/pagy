

###
This module is responsible for encapsulating
a row and all its functionality
###


class RowModel extends Backbone.Model

    

class RowView extends Backbone.View

  tagName: "div"
    
  className: "row"
    
  events:
    "click button.add-row.below": "addRowBelow"
    "click button.add-row.above": "addRowAbove"
    
  initialize: () ->  
    @model = @model || new RowModel
    
    $addRowAbove = $ "<button></button>"
    $addRowBelow = $ "<button></button>"
    
    $addRowAbove.addClass "add-row above"
    $addRowBelow.addClass "add-row below"
    
    $addRowAbove.text Pagy.Dictionary.giveMe "addRowAboveCaption"
    $addRowBelow.text Pagy.Dictionary.giveMe "addRowBelowCaption"
    
    $controls = $ "<div></div>"
    $controls.addClass "controls"
    $controls.append $addRowAbove
    $controls.append $addRowBelow
    
    @$el.append $controls
    
    @render()


  render: () -> 


  addRowBelow: () ->
    @model.trigger "addRowBelow"
    
    
  addRowAbove: () ->
    @model.trigger "addRowAbove"



# exports
window.Pagy = window.Pagy || {}
window.Pagy.RowModel = RowModel
window.Pagy.RowView = RowView