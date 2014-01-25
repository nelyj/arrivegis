class App.Collections.Directions extends Backbone.Collection
  model: App.Models.Direction
  url: '/directions'

  sync: (method, model, opts) ->
    url: 'directions/customs'

    options =
      url: 'directions/customs'
      type: 'GET'
      data: $.param({ "id": opts.id })

    Backbone.sync.call this, model , this, _.extend(options
    , opts)

