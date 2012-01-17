class Backbone.FormBuilder.Fields.Text extends Backbone.FormBuilder.Fields.Base
  input: (name, value) ->
    input = $('<input />')
    input.attr('name', name)
    input.attr('type', 'text')
    input.attr('value', value)
    input
