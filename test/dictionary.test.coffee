
###
This test module is responsible
for testing the Pagy.Dictionary module.
###

dictionary = Pagy.Dictionary


module "dictionary"
    

###
Test the dictionary initialization
process.
###
test "dictionary initialization", () ->
  ok ((dictionary.giveMe "exitButtonCaption") != null), "should find the key"
