(function() {
  var ajaxCacheResponseFilter, eventNames, name, pageEvent, _i, _len;

  ajaxCacheResponseFilter = function(options, originalOptions, jqXHR) {
    if (applicationCache && applicationCache.status !== applicationCache.UNCACHED && applicationCache.status !== applicationCache.OBSOLETE) {
      return options.isLocal = true;
    }
  };

  $.ajaxPrefilter(ajaxCacheResponseFilter);

  $(document).bind('mobileinit', function() {
    $("#welcome").live('pagecreate', function(event, data) {
      return console.log('pagecreate for welcome %o %o', event, data);
    });
    return $.mobile.jqmRouter = {
      ajaxApp: true
    };
  });

  pageEvent = function(event, data) {
    return console.log('%s %o %o', event.type, event, data);
  };

  eventNames = ['pagebeforechange', 'pagechange', 'pagechangefailed', 'pagebeforeload', 'pageload', 'pageloadfailed', 'pagebeforecreate', 'pagecreate', 'pageinit', 'pagebeforeshow', 'pageshow', 'pagebeforehide', 'pagehide', 'pageremove', 'updatelayout'];

  for (_i = 0, _len = eventNames.length; _i < _len; _i++) {
    name = eventNames[_i];
    $(document).bind(name, pageEvent);
  }

}).call(this);
