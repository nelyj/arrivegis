class App.Views.GoogleMapView extends Backbone.View
	template: JST['app/templates/google_map']

	initialize: ->
		@collection.on('reset', this.render, this)

	render: ->
		console.log "Estoy en el render"