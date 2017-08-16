Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "searches#index"

  resources :search_histories
  resources :searches do
    member do
      get :sidebar
    end
  end
  
end
