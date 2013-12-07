#= require_self
#= require_tree ./templates
#= require_tree ./views
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./routers


window.App = 
  Routers: {}
  Views: {}
  Collections: {}
  Models: {}
  initialize: ->
    new App.Routers.RutasRouter()
    Backbone.history.start()