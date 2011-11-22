(function() {
  var initApp, root;

  root = this;

  initApp = function() {
    new root.ApplicationRouter;
    return Backbone.history.start();
  };

  setTimeout(initApp, 800);

}).call(this);
