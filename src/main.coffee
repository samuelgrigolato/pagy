
###
This module is the initialization entry point.
To start Pagy's engine, one should call the _init_
method passing the root div as argument.
###
    

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
