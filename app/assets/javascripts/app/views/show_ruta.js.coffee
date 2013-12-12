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
    directions = new App.Collections.Directions
    opts = 
      id: @modelo.id

    console.log @modelo.id
    #console.log opts
    directions.sync('customs',directions,opts)
    directions.fetch()

    console.log directions
    $('h2').html(" Cargando ruta - Espere")

    $('.contenedor').fadeOut '10000', ->
      
      $('.col-md-7 h1').html('')
      $('.col-md-7 h4').html('')
      $('.jumbotron').html('')
      $('.contenedor').fadeIn '10000'

    #debugger;