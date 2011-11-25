jQuery Mobile (jQM) Application Using Backbone
==============================================

This project explores how to create a jQuery Mobile/Backbone.js JavaScript
application that can operate in an offline mode.

jQM provides an implementation of decent cross-platform mobile interfaces.  As
jQuery is a DOM manipulation tool, and not an application framework, so jQM
seems to [conform to that mold] [3]. Therefore, we need something like
Backbone.js to provide for the missing pieces: structure, persistence, business
entities, view interaction processiong.

Background
----------

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
transition is the browser location updated, in order that it accurately
reflects the Page being displayed.

[The process] [5] of Page transition causes [events to fire] [4] that the
application developer is intended to observe in order to implement custom
behavior.

Can you see how this makes integration of jQM and Backbone a challenge? Well,
for me it was difficult, since I initially saw jQM as nothing more than a
widget toolkit that overstepped it's bounds into routing URL changes into
functions. Embracing jQM, listening to location changes becomes irrelevant.
Additionally, there are implications due to how jQM manages Page unloading.

Backbone.Router is insufficient for processing these Page transitions, as it
does not provide for the fine-grained interaction needed in the Page lifecycle.

<h4>Loading Content</h4>

There are two [conventional approaches] [1] to providing jQM Page content:

  1. Single Page: Links to pages cause an AJAX load of the page. There is a way
     to prefetch a linked page.

  2. Multiple Page: All pages are defined in a single html document, so that
     links to pages avoid AJAX loading of the pages.

A third approach jQM can support that is not conventional and the
implementation of which is not immediately obvious:

  3. Pages are rendered on the fly using client-side templates.

You can see the first approach in the public/prefetch directory. Since I am
pursuing an offline application, I need to use the second or third approach. It
is not desirable to have all possible Pages in the DOM at the same time, coming
down in a single HTML page. Therefore, we choose option three.


How It Works
------------

In Backbone, we are accustomed to using the location change events in order to
render a template and update the DOM, usually by way of a Backbone.Router and
Backbone.View.

Instead, with jQuery Mobile, anchors are hijacked in order to:

 1. Load the page referenced by the href
 2. Change (transition) from the active page to the loaded page
 3. Update the browser location to reflect the new page

When this process occurs, events are [fired at various points] [4]. What we
need, considering an application that uses the third approach described above,
is an opportunity to:

 1. 'Load the page' using client-side templates, which we'd render in our
    Backbone.View
 2. Bind our Backbone.View events to the created Node

To accomplish 1, we need to handle the 'pagebeforeload' event and
preventDefault behavior. When 2 should occur has not become clear to me, but I
suspect that when we use a Backbone.View to create our Page, we don't need
another event. Of course, should we decide to use one of the two conventional
approaches to load a Page (Single Page or Multiple Page), we would want an
opportunity to bind our Backbone.View to the created DOM node, and therefore
would use 'pagebeforeshow' or possibly even 'pageshow'.

Compared to the default pattern of [observing jQM Page events] [4],
[jquery.mobile.router] [6] allows for a cleaner approach to managing the
various handler functions associated with the events, thereby filling the role
of Backbone.Router, with the fine-grained Page event handling we need.


[1]: http://jquerymobile.com/demos/1.0/docs/pages/page-anatomy.html "jQM Page Anatomy"
[2]: http://jquerymobile.com/demos/1.0/docs/about/features.html "jQM Features"
[3]: http://jquerymobile.com/demos/1.0/docs/about/intro.html "jQM Overview"
[4]: http://jquerymobile.com/demos/1.0/docs/api/events.html "jQM Events"
[5]: http://jquerymobile.com/demos/1.0/docs/pages/index.html "jQM Pages"
[6]: https://github.com/azicchetti/jquerymobile-router "jQM Router"
[7]: http://documentcloud.github.com/backbone/#Router "Backbone.Router"
[8]: http://documentcloud.github.com/backbone/#History "Backbone.History"
