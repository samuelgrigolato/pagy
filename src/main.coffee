
###
This module is the initialization entry point.
To start Pagy's engine, one should call the _init_
method passing the root div as argument.
###
    

class Main

  _menuMode_onChange: () ->
    mode = @menu.get "mode"
    @viewport.set "mode", mode
    

  init: ($el) ->
    $el.addClass "pagy"
    
    @viewport = new Pagy.ViewportModel
    @menu = new Pagy.MenuModel
    
    viewportView = new Pagy.ViewportView { model: @viewport }
    $el.append viewportView.el
    
    menuView = new Pagy.MenuView { model: @menu }
    $el.append menuView.el

    @menu.on "change:mode", () => @_menuMode_onChange()
    

# initialization hook
window.onload = () ->
  main = new Main
  $divs = $ ".pagy-autoinit"
  $divs.each () -> 
    main.init ($ this)

# exports
window.Pagy = window.Pagy || {}
window.Pagy.Main = Main
