
class Main

  square: (x) -> x * x


# initialization hook
window.onload = () ->
  main = new Main
  console.log "The square of 5 is " + (main.square 5)

# exports
window.Main = Main
