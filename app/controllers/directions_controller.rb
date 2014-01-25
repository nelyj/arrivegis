class DirectionsController < ApplicationController
  
  respond_to :json

  def index
    respond_with(@directions = Direction.all)
  end

  def custom
    @ruta = current_user.cargas.find(params[:id])

    extension = File.extname(@ruta.file_name.to_s)
    excel = Roo::Excel.new(Dir.pwd+"/public"+@ruta.file_name.to_s)

    excel.default_sheet = excel.sheets.first
    headers = Hash.new
    
    excel.row(1).each_with_index {|item, index| headers[item] = index }
    indice = 1

    ((excel.first_row + 1)..excel.last_row).each do |row|
      direction = @ruta.directions.create(address: excel.row(row)[headers[headers.keys[0]]] )
    end

    @response = {error: 'Direcciones cargadas'}
    respond_with(@response)

  end

  def customs
    @ruta = Carga.find(params[:id])
    extension = File.extname(@ruta.file_name.to_s)
    excel = Roo::Excel.new(Dir.pwd+"/public"+@ruta.file_name.to_s)

    excel.default_sheet = excel.sheets.first
    headers = Hash.new
    excel.row(1).each_with_index {|item, index| headers[item] = index }
    indice = 1

    @responses = Array.new

    ((excel.first_row + 1)..4).each do |row|
      columna = Direction.new

      unless indice > 0
        columna.columna_uno = excel.row(row)[headers[headers.keys[0]]]
      else
        columna.address = excel.row(row)[headers[headers.keys[0]]]
        columna.id = indice
      end

      indice = indice + 1
      @responses.push(columna)
    end

    respond_with(@responses)
  end

end
