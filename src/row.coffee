

###
This module is responsible for encapsulating
a row and all its functionality
###


class RowModel extends Backbone.Model

    

class RowView extends Backbone.View

  tagName: "div"
    
  className: "row"
    
  events:
    "click > .controls > .remove": "remove"
    
  initialize: () ->  
    @model = @model || new RowModel
    
    $removeButton = $ "<button></button>"
    $addColumnButton = $ "<button></button>"
    
    $removeButton.addClass "remove"
    $addColumnButton.addClass "add-column"
    
    $controls = $ "<div></div>"
    $controls.addClass "controls"
    $controls.append $removeButton
    $controls.append $addColumnButton
    
    @$el.append $controls
    
    @render()


  render: () -> 


  remove: () ->
    @model.trigger "remove"


# exports
window.Pagy = window.Pagy || {}
window.Pagy.RowModel = RowModel
window.Pagy.RowView = RowView
