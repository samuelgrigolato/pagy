
###
This module is responsible for encapsulating
a column and all its functionality
###
 

class ColumnModel extends Backbone.Model



class ColumnView extends Backbone.View

  tagName: "div"
    
  className: "column"



# exports
window.Pagy = window.Pagy || {}
window.Pagy.ColumnModel = ColumnModel
window.Pagy.ColumnView = ColumnView
