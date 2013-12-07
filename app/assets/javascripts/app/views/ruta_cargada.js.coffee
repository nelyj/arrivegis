class App.Views.RutaCargada extends Backbone.View
  tagName: 'tr'
  
  events:
    'click button': 'excelProcess'

  template: JST['app/templates/ruta_cargada']

  render: ->
    @$el.html( @template( @model.toJSON() ) )
    @

  excelProcess: ->
    Backbone.history.navigate('show/'+@model.get('id'), true)
    #excelView = new App.Views.ExcelStepOne({ model: @model })
   
    
    