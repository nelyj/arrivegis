class App.Views.GoogleMapView extends Backbone.View
	template: JST['app/templates/google_map']

	initialize: ->
		@collection.on('reset', @render, @)		

	
	activate: ->
		console.log "activate from google map view"
		mapOptions =
			zoom: 8
			center: new google.maps.LatLng(-34.397, 150.644)
			mapTypeId: google.maps.MapTypeId.ROADMAP

		domElement = @$("#map-canvas")
		@map = new google.maps.Map(domElement.get(0), mapOptions)
		this


	render: ->
		console.log "render from google map view"  
		console.log @collection
		@$el.html(@template({ data: @collection }))
		@activate()
		this

