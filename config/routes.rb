Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
      end
      resources :merchants, only: [:index, :show]

      resources :customers, only: [:index, :show]


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
