# A proxy view is a Backbone View that doesn't render any of its own HTML - it
# meerly adds behaviour to existing elements on the page.
#
# You can specify required html like this:
#
#     class TestProxyView extends Backbone.ProxyView
#       requirements: [
#         '#something'
#         'form'
#       ]
#
# You can also do this:
#
#     class TestProxyView extends Backbone.ProxyView
#       requirements:
#         'something': '#something'
#         'form': 'form'
#
# And then reference that in your code like so:
#
# @$requirement('form') # Nice and DRY!!
#
# When the proxy view is created - it'll check to see if those selectors exist.
# If they don't - it'll blow up!
#
# The requirements property can also be a function so you can have dynamic requirements based
# on stuff passed in through the options hash.
#
# The proxy view will also blow up if the element passed in does not exist. Like so:
#
#     // This will blow up.
#     new Backbone.ProxyViewTest({ el: $('#this-doesnt-exist') });

class Backbone.ProxyView extends Backbone.View

  # Array of selectors that must exist within the proxy view
  requirements: []

  constructor: ->
    Backbone.View.apply(this, arguments)
    @_validateExistanceOfElement()
    @_validateRequiredHTML()

  ready: ->
    # Do nothing.

  $requirement: (key) ->
    value = @_requirements()[key]
    throw "Unknown requirement `#{key}` for proxy view `#{@.constructor.name}`" unless value

    @$el.find value

  @toString: ->
    @name

  _requirements: ->
    if _.isFunction(@requirements)
      @requirements()
    else
      @requirements

  _validateExistanceOfElement: ->
    if @$el.length == 0
      throw "#{@.constructor.name} - Could not find proxy view element. #{@options.el}"

  _validateRequiredHTML: ->
    failed = []

    for selector in _.values(@_requirements())
      if @$el.find(selector).length == 0
        failed.push selector

    if failed.length
      throw "#{@.constructor.name} - Missing HTML elements: #{failed.join(', ')}"
