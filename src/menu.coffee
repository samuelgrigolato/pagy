
###
This module exports the view class
for the menu.
###


class MenuModel extends Backbone.Model

  defaults:
    
    ###
    Define the active mode of the application.
    Possible values: layout and preview.
    ###
    "mode": "layout"


class MenuView extends Backbone.View

  tagName: "div"
    
  className: "menu"
    
  events:
    "click button.exit": "exit"
    "click button.layout": "layoutMode"
    "click button.preview": "previewMode"


  initialize: () ->
  
    @model = @model || new MenuModel
    @listenTo @model, "change", @render
  
    $previewButton = $ "<button></button>"
    $previewButton.addClass "preview"
    $previewButton.text Pagy.Dictionary.giveMe "previewButtonCaption"
    $previewButton.appendTo @el
  
    $previewButton = $ "<button></button>"
    $previewButton.addClass "layout pressed"
    $previewButton.text Pagy.Dictionary.giveMe "layoutButtonCaption"
    $previewButton.appendTo @el
  
    $exitButton = $ "<button></button>"
    $exitButton.addClass "exit"
    $exitButton.text Pagy.Dictionary.giveMe "exitButtonCaption"
    $exitButton.appendTo @el
    
  
  render: () ->
  
    $previewButton = @$el.find "button.preview"
    $layoutButton = @$el.find "button.layout"

    $previewButton.removeClass "pressed"
    $layoutButton.removeClass "pressed"
    
    activeMode = @model.get "mode"
    if activeMode == "layout"
      $layoutButton.addClass "pressed"
    else
      $previewButton.addClass "pressed"


  exit: () ->
    message = Pagy.Dictionary.giveMe "exitConfirmMessage"
    Pagy.BrowserFacade.confirm message, (confirmed) ->
      if confirmed
        Pagy.BrowserFacade.closeWindow()
        
  
  layoutMode: () ->
    @model.set "mode", "layout"
        
  
  previewMode: () ->
    @model.set "mode", "preview"



# exports
window.Pagy = window.Pagy || {}
window.Pagy.MenuModel = MenuModel
window.Pagy.MenuView = MenuView
