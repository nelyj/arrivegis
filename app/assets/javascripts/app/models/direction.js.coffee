class App.Models.Direction extends Backbone.Model
  urlRoot: '/directions/'

  defaults:
    id: 1
    address: 'default address'
    latitude: 'default latitude'
    longitude: 'default longitude'
    priority: 'default priority'
    columna_uno: null
    columna_dos: null
    columna_tres: null
    error: null
    
  sync: (method, model, opts) ->
    url: 'directions/custom'

    options =
      url: 'directions/custom'
      type: 'GET'

    Backbone.sync.call this, null, this, _.extend(options
    , opts)


     
