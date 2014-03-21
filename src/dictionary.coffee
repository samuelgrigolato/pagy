 
class Dictionary

  constructor: () ->
    @expressions = 
      exitButtonCaption: "Exit"
      exitConfirmMessage: "Do you really want to exit?"

  giveMe: ($key) ->
    @expressions[$key]

# exports
window.Pagy = window.Pagy || {}
window.Pagy.Dictionary = new Dictionary