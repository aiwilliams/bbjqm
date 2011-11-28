(function() {
  var eventNames, name, pageEvent, _i, _len;

  $(document).bind('mobileinit', function() {});

  pageEvent = function(event, data) {
    return console.log([event.type, event, data]);
  };

  eventNames = ['pagebeforechange', 'pagechange', 'pagechangefailed', 'pagebeforeload', 'pageload', 'pageloadfailed', 'pagebeforecreate', 'pagecreate', 'pageinit', 'pagebeforeshow', 'pageshow', 'pagebeforehide', 'pagehide', 'pageremove', 'updatelayout'];

  for (_i = 0, _len = eventNames.length; _i < _len; _i++) {
    name = eventNames[_i];
    $(document).bind(name, pageEvent);
  }

}).call(this);
