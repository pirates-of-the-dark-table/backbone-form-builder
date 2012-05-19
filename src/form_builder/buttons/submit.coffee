class Backbone.FormBuilder.Buttons.Submit extends Backbone.FormBuilder.Buttons.Base

  button: (label, callback, options) ->
    button = $('<input type="submit">')
    button.val(label)
    if callback
      button.submit(callback)
    button
