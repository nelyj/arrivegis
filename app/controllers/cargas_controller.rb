class CargasController < ApplicationController
  def index
  end

  def new
    respond_to do |format|
      format.js
      format.html
    end
  end
end
