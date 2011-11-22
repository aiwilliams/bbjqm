(function() {
  var root;

  root = this;

  root.ApplicationRouter = Backbone.Router.extend({
    routes: {
      '': 'welcome',
      'next': 'next'
    },
    welcome: function() {
      var view;
      view = new root.WelcomeView;
      view.render();
      return $.mobile.changePage($(view.el).appendTo('body'));
    },
    next: function() {
      return $.mobile.changePage($('<div data-role="page"><div data-role="content"><p>You did it!</p></div></div>').appendTo('body'));
    }
  });

}).call(this);
