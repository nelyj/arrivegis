


class App.Routers.RutasRouter extends Backbone.Router
  routes:
    "" : "index"
    "show/:id": "show"

  initialize: ->
    @rutasCollection = new App.Collections.Rutas
    @rutasCollection.fetch()

  index: ->
    view = new App.Views.RutasCargadas({ collection: @rutasCollection })
    $('#rutas_generadas').after(view.render().el)

  show: (id) ->
  
    view = new App.Views.ShowRuta({model: @rutasCollection.get(id)})
    $('.contenedor').html(view.render().el)