
class Main

  init: ($el) ->
    $el.addClass "pagy"
    
    $menu = $ "<div></div>"
    $menu.addClass "pagy-menu"
    $menu.appendTo $el
    
    $viewport = $ "<div></div>"
    $viewport.addClass "pagy-viewport"
    $viewport.appendTo $el

# initialization hook
window.onload = () ->
  main = new Main
  $divs = $ ".pagy-autoinit"
  $divs.each () -> 
    main.init ($ this)

# exports
window.Main = Main
