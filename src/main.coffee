
###
This module is the initialization entry point.
To start Pagy's engine, one should call the _init_
method passing the root div as argument.
###


class ViewportView extends Backbone.View

  tagName: "div"

  className: "viewport"
  


class MenuView extends Backbone.View

  tagName: "div"
    
  className: "menu"
    
  events:
    "click button.exit": "exit"

  initialize: () ->
    $exitButton = $ "<button></button>"
    $exitButton.addClass "exit"
    $exitButton.text Pagy.Dictionary.giveMe "exitButtonCaption"
    $exitButton.appendTo @el

  exit: () ->
    message = Pagy.Dictionary.giveMe "exitConfirmMessage"
    Pagy.BrowserFacade.confirm message, (confirmed) ->
      if confirmed
        Pagy.BrowserFacade.closeWindow()

class Main


  init: ($el) ->
    $el.addClass "pagy"
    
    @viewport = new ViewportView
    $el.append @viewport.el
    
    @menu = new MenuView
    $el.append @menu.el

    


# initialization hook
window.onload = () ->
  main = new Main
  $divs = $ ".pagy-autoinit"
  $divs.each () -> 
    main.init ($ this)

# exports
window.Pagy = window.Pagy || {}
window.Pagy.Main = Main
