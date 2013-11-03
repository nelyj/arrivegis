class HomeController < ApplicationController
  def index
    if signed_in?
      render 'cargas/index'
    end
  end

  def about
  end
end
