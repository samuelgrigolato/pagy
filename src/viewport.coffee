
###
This module exports the application
viewport class
###


class RowModel extends Backbone.Model



class PageModel extends Backbone.Model

  defaults:
    
    ###
    Collection of root
    rows of this page. Each
    row can contain one
    or more columns
    ###
    "rows": [ new RowModel ]



class ViewportModel extends Backbone.Model

  defaults:
    
    ###
    Define the model of the
    page being edited by the user
    ###
    "page": new PageModel
    
    

class RowView extends Backbone.View

  tagName: "div"
    
  className: "row"
    
  initialize: () ->  
    @model = @model || new RowModel
    @render()


  render: () ->



class PageView extends Backbone.View

  tagName: "div"
    
  className: "page"
    
  initialize: () ->  
    @model = @model || new PageModel
    @render()
    
    
  render: () ->    
    @$el.empty()
    @_renderRow row for row in @model.get "rows"


  _renderRow: (row) ->    
    rowView = new RowView { model: row }    
    rowView.render()    
    @$el.append rowView.$el



class ViewportView extends Backbone.View

  tagName: "div"

  className: "viewport"

  initialize: () ->    
    @model = @model || new ViewportModel
    @render()


  render: () ->    
    @$el.empty()    
    page = @model.page    
    pageView = new PageView { model: page }
    pageView.render()
    @$el.append pageView.$el
    


# exports
window.Pagy = window.Pagy || {}
window.Pagy.ViewportView = ViewportView