Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
        get "/:id/favorite_customer", to: "favorite_customer#show"
      end
      resources :merchants, only: [:index, :show]

      namespace :customers do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
      end
      resources :customers, only: [:index, :show]

      namespace :transactions do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
      end
      resources :transactions, only:[:index, :show]

      namespace :items do
        get "/find_all", to: "search#index"
        get "/find", to: "search#show"
        get "/random", to: "random#show"
        get "/most_revenue", to: "most_revenue#index"
      end
      resources :items, only: [:index, :show]

      resources :invoices, only: [:index, :show]


      resources :invoice_items, only: [:index, :show]


    end
  end

end
