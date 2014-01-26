class App.Views.GoogleMapView extends Backbone.View
	template: JST['app/templates/google_map']

	initialize: ->
		@collection.on('reset', @render, @)	
		@start = new google.maps.LatLng(-32.466042574344975, -71.40262663597412)
		@end = new google.maps.LatLng(41.850033, -87.6500523)	

	activate: ->
		domElement = @$("#map-canvas")

		mapOptions =
			zoom: 15
			center: @start

		@map = new google.maps.Map(domElement.get(0), mapOptions)
		directionsDisplay = new google.maps.DirectionsRenderer( map : @map )
		@directionsService = new google.maps.DirectionsService()
		directionsDisplay.setMap(@map)
		directionsDisplay.setPanel(document.getElementById('directions-panel'))

		markerArray = []
		waypoints = []

		i = 0

		while i < @collection.length
			address = @collection.at(i).get('address')
			if address isnt ""
				waypoints.push
					location: address
					stopover: true

				i++

		request =
			origin: "macul 250, santiago"
			destination: "macul 250, santiago"
			waypoints: waypoints
			optimizeWaypoints: true
			travelMode: google.maps.DirectionsTravelMode.DRIVING

		@directionsService.route request, (response, status) ->
			directionsDisplay.setDirections response if status is google.maps.DirectionsStatus.OK
		this

	render: ->
		@$el.html(@template({ data: @collection }))
		@activate()
		this

