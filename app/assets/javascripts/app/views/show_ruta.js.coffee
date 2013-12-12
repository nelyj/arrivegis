class App.Views.ShowRuta extends Backbone.View
  events:
    'click button': 'readExcel'

  clasName: 'information'

  template: JST['app/templates/excel_step_one']

  initialize: ->
    @modelo = @model.toJSON()
    console.log "inicializa render"
    @render()

  render: ->
    this.$el.html( @template(@model.toJSON() ) )
    this

  readExcel: ->
    @id = @modelo.id
    directions = new App.Collections.Directions
    opts = 
      id: @id

    console.log @modelo.id
    #console.log opts
    directions.sync('customs',directions,opts)
    directions.fetch(opts)

    $('h2').html(" Cargando ruta - Espere")

    $('.contenedor').fadeOut '10000', ->
      
      $('.col-md-7 h1').html('')
      $('.col-md-7 h4').html('')
      $('.jumbotron').html('')

    
    $('.contenedor').fadeIn '10000', ->
      $('.jumbotron').html(JST['app/templates/confirm_mapa'](direcciones: directions))
      $('h2').html("Confirmacion")
      $('.jumbotron').after('<p><h2><b>NOTA: </b> Sólo se cargaron las <b>3</b> primerass direcciones para comprobar los datos. Al momento que que confirme los datos se cargarán todas las direcciones en el mapa.</h2></p>')
    #debugger;