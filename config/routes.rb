Arrivegis::Application.routes.draw do
  get "dashboard/index"

  resources :rutas, :controller => "cargas"

  root :to => 'home#index'
  devise_for :users

  devise_scope :user do
    get 'registrar', to: 'devise/registrations#new', as: :registrar
    get 'iniciar', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  match '/dashboard', to: 'dashboard#index', as: :dashboard

end
