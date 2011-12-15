# https://github.com/jquery/jquery-mobile/issues/1579#issuecomment-1209338
ajaxCacheResponseFilter = (options, originalOptions, jqXHR) ->
  if applicationCache &&
       applicationCache.status != applicationCache.UNCACHED &&
       applicationCache.status != applicationCache.OBSOLETE
     options.isLocal = true
$.ajaxPrefilter ajaxCacheResponseFilter


# To configure jQuery Mobile, you must bind to mobileinit before the jQM script
# is loaded.  See http://jquerymobile.com/demos/1.0/docs/api/globalconfig.html.
#
$(document).bind 'mobileinit', ->

  # Show how we do work on certain pages, certain events
  # NOTE This does not work!! Why?? The jquery.mobile.router does, though.
  $("#welcome").live 'pagecreate', (event, data) ->
    console.log 'pagecreate for welcome %o %o', event, data

  # Configure jquery.mobile.router.
  # We're not using hash routing, but full path (pathname+search+hash).
  # http://stackoverflow.com/questions/8154586/how-can-i-get-ios-to-cache-html5-documents-with-query-parameters
  $.mobile.jqmRouter={ ajaxApp: true }


# This code will show you the Page event lifecycle! A jQuery Mobile application
# developer is supposed to leverage these events to update the Page contents.
pageEvent = (event, data) ->
  console.log '%s %o %o', event.type, event, data

eventNames = [
  'pagebeforechange', 'pagechange', 'pagechangefailed',
  'pagebeforeload', 'pageload', 'pageloadfailed',
  'pagebeforecreate', 'pagecreate', 'pageinit',
  'pagebeforeshow', 'pageshow',
  'pagebeforehide', 'pagehide',
  'pageremove',
  'updatelayout'
]

for name in eventNames
  $(document).bind name, pageEvent
