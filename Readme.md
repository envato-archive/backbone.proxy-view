# Backbone.ProxyView

A proxy view is a Backbone View that doesn't render any of its own HTML - it meerly adds behaviour to existing elements on the page.

## Example

Given you already had this HTML on a page:

```html
<div id="buttons">
  <a href="#" class="next-button">Next</a>
</div>
```

And you wanted something to happen with the "Next", you could create a Proxy View
that looks like this:

```coffeescript
class TestProxyView extends Backbone.ProxyView
  events:
    "click .next-button": "next"

  next: ->
    alert "Oh hai!"

new ButtonProxyView el: "#buttons"
```

The benefit of this approch, is it gives you a nice structure to the random bits of jQuery you
scatter throught your application.

### Defining HTML requirements

If your Proxy View _requires_ an element on the page, you can define it as a
requirement like so:

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
class TestProxyView extends Backbone.ProxyView
  # ...
  next: ->
    @$requirement('something').addClass 'nexted' # Nice and DRY!!
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

## Contributing

We encourage all community contributions. Keeping this in mind, please follow these general guidelines when contributing:

* Fork the project
* Create a topic branch for what you’re working on (git checkout -b awesome_feature)
* Commit away, push that up (git push your\_remote awesome\_feature)
* Create a new GitHub Issue with the commit, asking for review. Alternatively, send a pull request with details of what you added.

## License

backbone.proxy-view is released under the MIT License (see the [license file](https://github.com/envato/backbone.proxy-view/blob/master/LICENCE)) and is copyright Envato & Keith Pitt, 2013.
