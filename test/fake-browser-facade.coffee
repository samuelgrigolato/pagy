
###
This test module contains
a mock for the Pagy.BrowserFacade interface,
allowing tests to inform expected user 
behavior.

@see Pagy.BrowserFacade for details.
###

class FakeBrowserFacade

  ###
  This attribute should be changed
  whenever a test subject are going
  to display a confirmation dialog.
  ###
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
  

  