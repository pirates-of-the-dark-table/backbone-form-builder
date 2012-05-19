Backbone.FormBuilder.Buttons ||= {}

class Backbone.FormBuilder.Buttons.Base extends Backbone.View
  initialize: (options = {}) ->
    @options = options

  className: 'button'

  render: ->
    @$el.html @button(@label, @callback, @options)

  button: (label, callback, options) ->
    button = $('<button>')
    button.click(callback)
    button.text(label)
    button
