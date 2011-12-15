# https://github.com/jquery/jquery-mobile/issues/1579#issuecomment-1209338
ajaxCacheResponseFilter = (options, originalOptions, jqXHR) ->
  if applicationCache &&
       applicationCache.status != applicationCache.UNCACHED &&
       applicationCache.status != applicationCache.OBSOLETE
     options.isLocal = true
$.ajaxPrefilter ajaxCacheResponseFilter

# http://forum.jquery.com/topic/problem-with-linking-when-running-offline-with-application-cache-manifest#14737000002751683
# This one doesn't help anything when we are online, yet have an up-to-date cache, as no error is occurring.
$(window.applicationCache).bind 'error', ->
  $.mobile.ajaxEnabled = false # Probably offline, use normal HTTP requests to get content, to fail-safe AJAX bugs when offline

# Since the above does not get invoked...
# This will turn off the ajax page transitions, and allows for query params to cached-loaded html pages on Safari.
# Change this to true to get the expected screen transitions!
# https://github.com/jquery/jquery-mobile/issues/1579#issuecomment-3166821
$(document).bind 'mobileinit', ->
  $.mobile.ajaxEnabled = false


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
