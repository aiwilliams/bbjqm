
  $(document).bind('mobileinit', function() {
    $.mobile.ajaxEnabled = false;
    $.mobile.hashListeningEnabled = false;
    return $.mobile.linkBindingEnabled = false;
  });
