jQuery Mobile (jQM) Application Using Backbone
==============================================

This project explores how to create a jQuery Mobile/Backbone.js JavaScript
application that can operate in an offline mode. It provides value by
documenting the what and why.

Background
----------

jQM provides an implementation of decent cross-platform mobile interfaces.  As
jQuery is a DOM manipulation tool, and not an application framework, so jQM
seems to [conform to that mold] [3]. Therefore, we need something like
Backbone.js to provide for the missing pieces: structure, persistence, business
entities, view interaction processiong.

<h4>Screen Transitions (or, Processing URL Changes)</h4>

In a Backbone project, we [listen to location change events] [8] in order to
invoke code that in some way modifies the user interface. Backbone.History
accomplishes this through the application-defined [Backbone.Router] [7]
instances, which provide a mapping of the location value to the function we
want invoked. It is in these functions that we do our DOM manipulation and wire
UI event listeners, typically by using Backbone.View instances.

jQM is different. It has been designed to hijack all anchors (and form buttons)
in your DOM, such that when a click occurs, it attempts to load the 'Page' that
contains the content to show for the href (resource). Only after a successful
load, create, and initialize is the browser location updated, in order that it
accurately reflects the Page being displayed. Under this model, we not longer
care much for location changes, but instead want only to prepare a Page before
it is shown. [The process] [5] of Page transition causes [events to fire] [4]
that the application developer is intended to observe in order to implement
custom behavior.

Backbone.Router is insufficient for processing these Page transitions, as it
does not provide for the fine-grained interaction needed in the Page lifecycle.

What we do need, though, is the elegance of Backbone.Router - the ability to
connect certain Pages to custom code in an <em>organized</em> way. It can be as
simple as a map of Page url to function, but the introduction of Page lifecycle
events may require that we have a function for multiple phases of a single
Page. We can use [jquery.mobile.router] [6] as a solution, though we do not use
it in all our examples so that we can see if other, simpler patterns might
emerge.

<h4>Loading Content</h4>

There are two [conventional approaches] [1] to providing jQM Page content:

  1. Single Page: Links to pages cause an AJAX load of the page. There is a way
     to prefetch a linked page.

  2. Multiple Page: All pages are defined in a single html document, so that
     links to pages avoid AJAX loading of the pages.

A third approach jQM can support that is not conventional and the
implementation of which is not immediately obvious:

  3. Pages are rendered on the fly using client-side templates.

Each approach has it's own merits. You should know that the Single Page style
is the most degradable and only one that seems to work with all platforms
supported by jQM. The third style is not easily implemented, and is of
questionable value in jQM.

See public/single/index.html, public/multiple/index.html.

<h4>Making Views Respond to Model Changes</h4>

In Backbone, we are accustomed to using the location change events in order to
render a template, update the DOM, and bind a Backbone.View to it's 'el'ement,
usually by way of a Backbone.Router.

Instead, with jQuery Mobile, anchors are hijacked in order to:

 1. Load the page referenced by the href
 2. Prepare the content
 3. Update the browser location to reflect the new page
 4. Transition from the active page to the loaded page
 5. Dispose of the previously active page

When this process occurs, events are [fired at various points] [4]. What we
need is an opportunity to bind our Backbone.Views to the created elements.  We
will use 'pagebeforeshow'.


[1]: http://jquerymobile.com/demos/1.0/docs/pages/page-anatomy.html "jQM Page Anatomy"
[2]: http://jquerymobile.com/demos/1.0/docs/about/features.html "jQM Features"
[3]: http://jquerymobile.com/demos/1.0/docs/about/intro.html "jQM Overview"
[4]: http://jquerymobile.com/demos/1.0/docs/api/events.html "jQM Events"
[5]: http://jquerymobile.com/demos/1.0/docs/pages/index.html "jQM Pages"
[6]: https://github.com/azicchetti/jquerymobile-router "jQM Router"
[7]: http://documentcloud.github.com/backbone/#Router "Backbone.Router"
[8]: http://documentcloud.github.com/backbone/#History "Backbone.History"
