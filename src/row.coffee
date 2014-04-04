

###
This module is responsible for encapsulating
a row and all its functionality
###


class RowModel extends Backbone.Model

    

class RowView extends Backbone.View

  tagName: "div"
    
  className: "row"
    
  initialize: () ->  
    @model = @model || new RowModel
    @render()


  render: () -> 



# exports
window.Pagy = window.Pagy || {}
window.Pagy.RowModel = RowModel
window.Pagy.RowView = RowView