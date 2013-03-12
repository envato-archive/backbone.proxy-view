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

## Contributing

We encourage all community contributions. Keeping this in mind, please follow these general guidelines when contributing:

* Fork the project
* Create a topic branch for what you’re working on (git checkout -b awesome_feature)
* Commit away, push that up (git push your\_remote awesome\_feature)
* Create a new GitHub Issue with the commit, asking for review. Alternatively, send a pull request with details of what you added.

## License

backbone.proxy-view is released under the MIT License (see the [license file](https://github.com/envato/backbone.proxy-view/blob/master/LICENCE)) and is copyright Envato & Keith Pitt, 2013.
