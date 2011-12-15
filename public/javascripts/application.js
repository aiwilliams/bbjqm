(function() {
  var ControllerObject;

  ControllerObject = {
    welcome: function(eventType, matchObj, ui, page, evt) {
      return console.log('welcome: %o, %o, %o, %o, %o', eventType, matchObj, ui, page, evt);
    }
  };

  new $.mobile.Router([
    {
      "welcome.html(?:[?](.*))?": {
        events: "i",
        handler: "welcome"
      }
    }
  ], ControllerObject, {
    ajaxApp: true
  });

}).call(this);
