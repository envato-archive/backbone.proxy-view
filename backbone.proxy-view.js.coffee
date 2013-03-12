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
