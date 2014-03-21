 
dictionary = Pagy.Dictionary

test "dictionary initialization", () ->
  ok ((dictionary.giveMe "exitButtonCaption") != null), "should find the key"
