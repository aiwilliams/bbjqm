# To configure jQuery Mobile, you must bind to mobileinit before the jQM script
# is loaded.  See http://jquerymobile.com/demos/1.0/docs/api/globalconfig.html.
#
$(document).bind 'mobileinit', ->
  # $.mobile.property = value


# This code will show you the Page event lifecycle! A jQuery Mobile application
# developer is supposed to leverage these events to update the Page contents.
pageEvent = (event, data) ->
  console.log [event.type, event, data]

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
