
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
      
    ###
    Define the active mode of the application.
    Possible values: layout and preview.
    ###
    "mode": "layout"


  _mode_onChange: () ->
    page = @get "page"
    page.set "mode", @get "mode"
    

  initialize: () ->
    @set "page", new Pagy.PageModel
    @on "change:mode", () => @_mode_onChange()



class ViewportView extends Backbone.View

  tagName: "div"

  className: "viewport"

  initialize: () ->    
    @model = @model || new ViewportModel
    @model.on "change:mode", () => @render()
    @render()


  render: () ->  
    @$el.empty()
    
    mode = @model.get "mode"
    @$el.removeClass "layout-mode preview-mode"
    @$el.addClass "#{mode}-mode"
    
    page = @model.get "page"    
    pageView = new Pagy.PageView { model: page }
    pageView.render()
    @$el.append pageView.$el
    


# exports
window.Pagy = window.Pagy || {}
window.Pagy.ViewportModel = ViewportModel
window.Pagy.ViewportView = ViewportView
