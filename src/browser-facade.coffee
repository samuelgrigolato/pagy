
###
This module is responsible for
shielding the rest of Pagy's code
from browser native interfaces like
alert display and close methods.
The existance of this module ease the
process of mocking the browser for unit
tests.

@see PagyTests.FakeBrowserFacade for details
on the test mock of this module.
###

class BrowserFacade


  closeWindow: () ->
    location.href = "about:blank"

    
  confirm: (message, callback) ->
    response = window.confirm(message)
    callback(response)



# exports
window.Pagy = window.Pagy || {}
window.Pagy.BrowserFacade = new BrowserFacade