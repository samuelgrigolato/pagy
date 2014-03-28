
###
This module is the initialization entry point.
To start Pagy's engine, one should call the _init_
method passing the root div as argument.
###

class Main


  init: ($el) ->
    $el.addClass "pagy"
    
    $viewport = $ "<div></div>"
    $viewport.addClass "viewport"
    $viewport.appendTo $el
    
    $menu = $ "<div></div>"
    $menu.addClass "menu"
    $menu.appendTo $el
    
    $exitButton = $ "<button></button"
    $exitButton.addClass "exit"
    $exitButton.text Pagy.Dictionary.giveMe "exitButtonCaption"
    $exitButton.appendTo $menu
    $exitButton.click () => 
      this.exitButton_onClick()


  exitButton_onClick: () ->
    message = Pagy.Dictionary.giveMe "exitConfirmMessage"
    Pagy.BrowserFacade.confirm message, (confirmed) ->
      if confirmed
        Pagy.BrowserFacade.closeWindow()
    


# initialization hook
window.onload = () ->
  main = new Main
  $divs = $ ".pagy-autoinit"
  $divs.each () -> 
    main.init ($ this)

# exports
window.Pagy = window.Pagy || {}
window.Pagy.Main = Main
