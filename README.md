Backbone Application Using jQuery Mobile (jQM)
=====================================================

This project explores how to create a Backbone JavaScript application with
jQuery Mobile. Backbone is the central technology, with jQM taking a back seat
as an implementation detail of having decent cross-platform mobile views. From
one perspective, this seems like a Good Thing, since jQuery is a DOM
manipulation tool, not an application framework, and jQM [comes from that mold]
[3]. In fact, are not [all features] [2] but one about UI issues?


There are two conventional [ways to implement/layout jQM projects] [1]:

  * Single Page: Links to pages cause an AJAX load of the page. There is a way
    to prefetch a linked page.

  * Multiple Page: All pages are defined in a single html document, so that
    links to pages avoid AJAX loading of the pages.

Introducing Backbone presents some challenges:

  * It provides Routers. jQM has something like that which has to be shut off -
    it hijacks every href on the page to implement page loading and
    transitions. We need to build and load pages differently if we do shut off
    jQM.

  * It has Views. In my experience with Backbone, one screen is likely to
    have at least two of these, and I would submit that a heirarchy is likely
    to form in a significantly large application.

  * How does this jive with jQM's 'widget' stuff?

[1]: http://jquerymobile.com/demos/1.0/docs/pages/page-anatomy.html "jQuery Mobile Page Anatomy"
[2]: http://jquerymobile.com/demos/1.0/docs/about/features.html "jQuery Mobile Features"
[3]: http://jquerymobile.com/demos/1.0/docs/about/intro.html "jQuery Mobile Overview"
