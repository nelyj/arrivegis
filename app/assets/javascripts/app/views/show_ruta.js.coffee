class App.Views.ShowRuta extends Backbone.View
  events:
    'click button.readExcel': 'readExcel'
    'click button.cargarDatos': 'cargarDatos'
    'click button.verMapa': 'verMapa'

  clasName: 'information'

  template: JST['app/templates/excel_step_one']

  initialize: ->
    @modelo = @model.toJSON()
    @render()

  render: ->
    this.$el.html( @template(@model.toJSON() ) )
    this

  readExcel: ->
    @id = @modelo.id
    directions = new App.Collections.Directions
    opts = 
      id: @id

    directions.sync('customs',directions,opts)
    directions.fetch(opts)

    $('h2').html(" Cargando ruta - Espere")

    $('.contenedor').fadeOut '10000', ->
      $('.col-md-7 h1').html('')
      $('.col-md-7 h4').html('')
      $('.jumbotron').html('')

    $('.contenedor').fadeIn '10000', ->
      $('.jumbotron').html(JST['app/templates/confirm_mapa'](direcciones: directions))
      $('h2').html("Creación de mapa")
      $('.col-md-7 h1').html('Confirmación de los datos')
      $('.jumbotron').after("<p><h4 class='nota'><b>NOTA: </b> Sólo se cargaron las <b>3</b> primeras direcciones para comprobar los datos. Al momento que que confirme los datos se cargarán todas las direcciones en el mapa.</h4></p>")
    #debugger;

  cargarDatos: ->
    @id = @modelo.id
    direction = new App.Models.Direction
    opts = 
      id: @id

    direction.sync('custom', direction, opts)
    direction.fetch(opts)

    $('.contenedor').fadeOut '10000', ->
      $('.col-md-7 h1').html('')
      $('.col-md-7 h4').html('')
      $('.jumbotron').html('') 

    $('.contenedor').fadeIn '10000', ->
      $('.nota').remove()
      $('h2').html("Creación de mapa")
      $('.jumbotron').html("<h2><b>Cargando datos para el mapa - Espere </b></h2>")
      

    $('.contenedor').fadeOut '20000', ->
      $('.col-md-7 h1').html('')
      $('.col-md-7 h4').html('')
      $('.jumbotron').html('') 

     $('.contenedor').fadeIn '10000', ->
      $('h2').html("Creación de mapa")
      $('.jumbotron').html(JST['app/templates/mapa_cargado_exitoso'](model: direction))
      $('.col-md-7 h1').remove()
      $('.page-header').remove()
            
  verMapa: ->
    Backbone.history.navigate('show_map/'+@modelo.id, true)


