class App.Models.Ruta extends Backbone.Model
  urlRoot: '/rutas/'

  sync: (method, model, options) ->
    options =
      url: 'rutas/readExcel'
      type: 'GET'
    _.extend options, options

    Backbone.sync.call this, null, this, _.extend(
      url: 'rutas/readExcel'
      type: method
    , options)