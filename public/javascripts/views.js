(function() {
  var PageView, WelcomeView, root;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  PageView = (function() {

    __extends(PageView, Backbone.View);

    function PageView() {
      PageView.__super__.constructor.apply(this, arguments);
    }

    PageView.prototype.el = '<div data-role="page"><div data-role="content"></div></div>';

    return PageView;

  })();

  WelcomeView = (function() {

    __extends(WelcomeView, PageView);

    function WelcomeView() {
      WelcomeView.__super__.constructor.apply(this, arguments);
    }

    WelcomeView.prototype.render = function() {
      return this.$('div[data-role=content]').html('<p>Welcome!</p><p><a href="#next">Next</a></p>');
    };

    return WelcomeView;

  })();

  root = this;

  $.extend(root, {
    WelcomeView: WelcomeView
  });

}).call(this);
