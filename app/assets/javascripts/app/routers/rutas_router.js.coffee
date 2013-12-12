


class App.Routers.RutasRouter extends Backbone.Router
  routes:
    "" : "index"
    "show/:id": "show"

  initialize: ->
    console.log "inicializar"
    @rutasCollection = new App.Collections.Rutas
    @rutasCollection.fetch()

  index: ->
    console.log "index"
    view = new App.Views.RutasCargadas({ collection: @rutasCollection })
    $('#rutas_generadas').after(view.render().el)

  show: (id) ->
    console.log "carga show router"
    view = new App.Views.ShowRuta({model: @rutasCollection.get(id)})
    $('.contenedor').html(view.render().el)