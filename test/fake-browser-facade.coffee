 
class FakeBrowserFacade

  whenPromptedToConfirmReturn: true

  closeWindow: () ->
    @windowClosed = true
    
  confirm: (message, callback) ->
    userResponse = @whenPromptedToConfirmReturn
    callback(userResponse)
    
# exports
window.PagyTests = window.PagyTests || {}
window.PagyTests.FakeBrowserFacade = new FakeBrowserFacade

# inject into Pagy
window.Pagy.BrowserFacade = window.PagyTests.FakeBrowserFacade
  

  