class App.Views.RutasCargadas extends Backbone.View
  tagName: 'tbody'
  initialize: ->
    @collection.on('add', @addOne, @)

  render: ->
    @collection.each(@addOne, @)
    @

  addOne: (model) ->
    rutaView = new App.Views.RutaCargada({ model: model })
    @$el.append( rutaView.render().el )
    @