class CargasController < ApplicationController
  def index
  end

  def new
    @carga = Carga.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @carga = Carga.new(params[:carga])
    respond_to do |format|
      if @carga.save
        format.html { redirect_to rutas_path, notice: 'Se ha cargado correctamente el archivo. Ahora puede crear el mapa de rutas' }
        format.json { render json: rutas_path, status: :created, location: @carga }
      else
        format.html { render action: "new" }
        format.json { render json: @carga.errors, status: :unprocessable_entity }
      end
    end
  end
end
