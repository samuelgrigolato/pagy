
class Main

  init: ($el) ->
    $el.addClass "pagy"
    
    $viewport = $ "<div></div>"
    $viewport.addClass "pagy-viewport"
    $viewport.appendTo $el
    
    $menu = $ "<div></div>"
    $menu.addClass "pagy-menu"
    $menu.appendTo $el

# initialization hook
window.onload = () ->
  main = new Main
  $divs = $ ".pagy-autoinit"
  $divs.each () -> 
    main.init ($ this)

# exports
window.Main = Main
