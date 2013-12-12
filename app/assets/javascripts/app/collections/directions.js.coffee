class App.Collections.Directions extends Backbone.Collection
  model: App.Models.Direction
  url: '/directions'

  sync: (method, collection, opts) ->
    url: 'directions/customs'
    console.log "sync method"
    options =
      url: 'directions/customs'
      type: 'GET'
      data: $.param({ id: opts.id })

    console.log opts.id

    Backbone.sync.call this, null, this, _.extend(options
    , opts)