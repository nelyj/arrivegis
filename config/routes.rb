Arrivegis::Application.routes.draw do

  resources :personas
  resources :directions do
    collection do 
      get :custom
      get :customs
    end
  end

  get "dashboard/index"

  resources :rutas, :controller => "cargas" do
    collection do 
      get :readExcel
    end    
  end

  root :to => 'home#index'
  devise_for :users

  devise_scope :user do
    get 'registrar', to: 'devise/registrations#new', as: :registrar
    get 'iniciar', to: 'devise/sessions#new', as: :login
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  match '/dashboard', to: 'dashboard#index', as: :dashboard

end
