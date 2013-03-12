# Backbone.ProxyView

A proxy view is a Backbone View that doesn't render any of its own HTML -
it meerly adds behaviour to existing elements on the page.

You can specify required html like this:

```coffeescript
class TestProxyView extends Backbone.ProxyView
  requirements: [
    '#something'
    'form'
  ]
```

You can also do this:

```coffeescript
class TestProxyView extends Backbone.ProxyView
 requirements:
   'something': '#something'
   'form': 'form'
```

And then reference that in your code like so:

```coffeescript
@$requirement('form') # Nice and DRY!!
```

When the proxy view is created - it'll check to see if those selectors exist.
If they don't - it'll blow up!

The requirements property can also be a function so you can have dynamic requirements based
on stuff passed in through the options hash.

The proxy view will also blow up if the element passed in does not exist. Like so:

```javascript
// This will blow up.
new Backbone.ProxyViewTest({ el: $('#this-doesnt-exist') });
```
