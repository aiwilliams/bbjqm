root = this

root.ApplicationRouter = Backbone.Router.extend
  routes:
    '': 'welcome'
    'next': 'next'

  welcome: ->
    view = new root.WelcomeView
    view.render()
    $.mobile.changePage $(view.el).appendTo('body')

  next: ->
    $.mobile.changePage $('<div data-role="page"><div data-role="content"><p>You did it!</p></div></div>').appendTo('body')
