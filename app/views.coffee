class PageView extends Backbone.View
  el: '<div data-role="page"><div data-role="content"></div></div>'

class WelcomeView extends PageView
  render: ->
    @$('div[data-role=content]').html '<p>Welcome!</p><p><a href="#next">Next</a></p>'

# Exports
root = this
$.extend root,
  WelcomeView:WelcomeView
