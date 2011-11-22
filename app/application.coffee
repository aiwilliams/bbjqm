root = this

# Create our Backbone.Routers. Instantiating these causes the global
# Backbone.history to be created - it is a necessary step before routing can
# occur. Each instance registers itself with the global Backbone.History
# instance, which is how History is able to call your Router when a hashchange
# occurs.
#
initApp = ->
  new root.ApplicationRouter
  Backbone.history.start()

# Show the splash page a bit.
#
setTimeout initApp, 800
