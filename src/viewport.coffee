
###
This module exports the application
viewport class
###


class ViewportModel extends Backbone.Model

  defaults:
    
    ###
    Define the model of the
    page being edited by the user
    ###
    "page": null
      
  initialize: () ->
    @page = new Pagy.PageModel



class ViewportView extends Backbone.View

  tagName: "div"

  className: "viewport"

  initialize: () ->    
    @model = @model || new ViewportModel
    @render()


  render: () ->    
    @$el.empty()    
    page = @model.page    
    pageView = new Pagy.PageView { model: page }
    pageView.render()
    @$el.append pageView.$el
    


# exports
window.Pagy = window.Pagy || {}
window.Pagy.ViewportView = ViewportView
