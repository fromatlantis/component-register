Element = require './element'
Registry = require './registry'
TAG = 'component-element'

class ComponentElement extends Element
  constructor: ->
    # Safari 9 fix
    return Element.apply(@, arguments)

  boundCallback: =>
    @__component_type = @component
    delete @component
    super

  lookupProp: (attr_name) ->
    return unless attr_name is 'component'
    'component'

Registry.register({tag: TAG})
customElements.define(TAG, ComponentElement)