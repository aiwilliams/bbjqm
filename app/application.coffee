ControllerObject =
  welcome: () ->
    console.log 'heard welcome!!'

new $.mobile.Router [
  { "welcome.html(?:[?](.*))?": { events: "i", handler: "welcome" } }
], ControllerObject, ajaxApp:true
