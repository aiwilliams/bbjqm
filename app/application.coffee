ControllerObject =
  welcome: (eventType, matchObj, ui, page, evt) ->
    console.log 'welcome: %o, %o, %o, %o, %o', eventType, matchObj, ui, page, evt

new $.mobile.Router [
  { "welcome.html(?:[?](.*))?": { events: "i", handler: "welcome" } }
], ControllerObject, ajaxApp:true
