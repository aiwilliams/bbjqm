# When jQuery Mobile is ready to go, configure it to allow for Backbone. This
# script MUST be loaded before the jquery.mobile script is loaded or these
# configurations may not have affect. See
# http://jquerymobile.com/demos/1.0/docs/api/globalconfig.html.
#
$(document).bind 'mobileinit', ->

  # DO NOT: Automatically handle clicks and form submissions through Ajax, when same-domain
  # Our Backbone.Views will handle all view events.
  $.mobile.ajaxEnabled = false

  # DO NOT: Automatically load and show pages based on location.hash
  # We leave this up to Backbone.Routers.
  $.mobile.hashListeningEnabled = false

  $.mobile.linkBindingEnabled = false
