Rails.application.routes.draw do
  #devise_for :users
  #resources :estagios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "inicials#index"
  
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  #get '/estagio_export' => 'estagios#export'
  get '/estagio_exportinscritos' => 'estagios#exportinscritos'

  resources :estagios do
    member do
      get 'export'
    end
  end

  #root :to => 'inicials#index'

  resources :inicials
  get 'inicial', to: 'inicials#index'
  post 'inicial', to: 'inicials#index'
end
