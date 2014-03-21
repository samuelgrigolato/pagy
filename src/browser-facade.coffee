 
class BrowserFacade

  closeWindow: () ->
    location.href = "about:blank"
    
  confirm: (message, callback) ->
    response = window.confirm(message)
    callback(response)

# exports
window.Pagy = window.Pagy || {}
window.Pagy.BrowserFacade = new BrowserFacade