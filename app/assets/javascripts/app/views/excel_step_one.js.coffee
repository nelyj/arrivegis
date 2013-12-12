class App.Views.ExcelStepOne extends Backbone.View
  template: JST['app/templates/excel_step_one']
  
  initialize: ->
    vent.on('excelstepone:show', @showExcel, @)

  render: ->
    console.log "render excel step one"
    @$el.html( @template( @model.toJSON() ) )
    @

  show: ->
    console.log "show step one"
    Backbone.history.navigate('show/:id', 1)