Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get '/merchants/find', to: "merchants/search#show"
      get '/merchants/find_all', to: "merchants/search#index"
      get '/merchants/random', to: "merchants/random#show"
      resources :merchants, only: [:index, :show]


      namespace :items do
        controller :search do
          get "/find_all", to: "items/search#index"
          get "/find", to: "items/search#show"
        end
        get "/items/random", to: "items/random#show"
      end
      resources :items, only: [:index, :show]

      resources :invoices, only: [:index, :show]


      resources :invoice_items, only: [:index, :show]


    end
  end

end
