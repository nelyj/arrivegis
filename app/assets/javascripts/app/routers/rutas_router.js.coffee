


class App.Routers.RutasRouter extends Backbone.Router
  routes:
    "" : "index"
    "show/:id": "show"
    "show_map/:id" : "show_map"

  initialize: ->
    @rutasCollection = new App.Collections.Rutas
    @directionCollection = new App.Collections.Directions
    @rutasCollection.fetch()

  index: ->
    view = new App.Views.RutasCargadas({ collection: @rutasCollection })
    $('#rutas_generadas').after(view.render().el)

  show: (id) ->
    console.log "carga show router"
    view = new App.Views.ShowRuta({model: @rutasCollection.get(id)})
    $('.contenedor').html(view.render().el)

  show_map: (id) ->
    console.log "Initialize show_map "
    
    opts =
      id: id
      reset: true
    
    @directionCollection.fetch({id: id})
    @directionCollection.sync('customs', @directionCollection, opts)
    @directionCollection.fetch(opts)

    view = new App.Views.GoogleMapView({collection: @directionCollection })
    $('.contenedor').html(view.render().el)

