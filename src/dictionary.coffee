
###
This module is responsible for
the internationalization routines.
At this moment the only supported
language is English, but this 
translation layer make it very
easy to add other languages
in the future.
###

class Dictionary


  constructor: () ->
    @expressions = 
      exitButtonCaption: "Exit"
      exitConfirmMessage: "Do you really want to exit?"
      previewButtonCaption: "Preview"
      layoutButtonCaption: "Layout"


  giveMe: ($key) ->
    @expressions[$key]



# exports
window.Pagy = window.Pagy || {}
window.Pagy.Dictionary = new Dictionary