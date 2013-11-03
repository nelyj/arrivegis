Arrivegis::Application.routes.draw do
  root :to => 'home#index'
  devise_for :users

  devise_scope :user do
    get 'registrar', to: 'devise/registrations#new', as: :registrar
    get 'login', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  
end
