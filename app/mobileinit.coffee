# To configure jQuery Mobile, you must bind to mobileinit before the jQM script
# is loaded.  See http://jquerymobile.com/demos/1.0/docs/api/globalconfig.html.
#
$(document).bind 'mobileinit', ->

  # Show how we do work on certain pages, certain events
  $("#welcome").live 'pagecreate', (event, data) ->
    console.log 'pagecreate for welcome %o %o', event, data

  # We're not using hash routing
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
