class Backbone.FormBuilder.Form extends Backbone.View

  tagName: 'form'

  initialize: (options) ->
    @fields ||= []
    @buttons ||= []
    callbacks =
      success: options.success
      error: options.error

    $(@el).submit =>
      @save(callbacks)
      false

  formData: ->
    fields = $(@el).serializeArray()
    result = {}
    for field in fields
      value = field.value || ""
      result[field.name] = value
    result

  save: (options = {}) ->
    form_builder = @
    key = @modelKey()
    data = {}
    data[key] = @formData()

    @model.save data,
      success: options.success
      error: (model, response) ->
        options.error(@model) if options.error
        errors = form_builder.parseErrors(response.responseText)
        form_builder.renderErrors(errors)

  modelKey: ->
    Backbone.FormBuilder.underscore @model.constructor.name

  render: ->
    $(@el).html ""
    for field in @fields
      field.render()
      $(@el).append(field.el)
    for button in @buttons
      button.render()
      $(@el).append(button.el)
    @

  renderErrors: (errors) ->
    for field in @fields
      field.renderErrors(errors[field.name])

  addField: (name, type, options = {}) ->
    field = new Backbone.FormBuilder.Fields[Backbone.FormBuilder.camelize type](options)
    field.model = @model
    field.name = name
    @fields.push field
    field

  addButton: (type, label, callback, options) ->
    button = new Backbone.FormBuilder.Buttons[Backbone.FormBuilder.camelize type](options)
    button.callback = callback
    button.label = label
    @buttons.push button
    button

  parseErrors: Backbone.FormBuilder.parseErrors
