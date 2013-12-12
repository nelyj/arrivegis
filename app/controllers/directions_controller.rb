class DirectionsController < ApplicationController
  
  respond_to :json

  def index
    respond_with(@directions = Direction.all)
  end

  def custom
    @response = {id: 100, address: 'los avellanos 268', latitude: 199, longitude: 199}
    respond_with(@response)
  end

  def customs
    @ruta = Carga.find(params[:id])

    @responses = [{id: 100, address: 'los avellanos 268', latitude: 199, longitude: 199}]

    respond_with(@responses)
  
  end
end
