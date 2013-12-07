class CargasController < ApplicationController
  before_filter :authenticate_user!

  def index
    @cargas = current_user.cargas
  
    respond_to do |format|
      format.json { render json: @cargas }
      format.html
    end
  end

  def new
    @carga = current_user.cargas.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @carga = current_user.cargas.new(params[:carga])
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

  def show
    @carga = current_user.cargas.find(params[:id])
    respond_to do |format|
      format.json { render json: @carga }
    end
  end

  def readExcel
    @datos = [1,2,3,4,5,6]

    respond_to do |format|
      format.json { render json: @datos }
    end
  end
end
