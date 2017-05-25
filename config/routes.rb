Rails.application.routes.draw do
  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  get "/carted_products_create" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"


  get "/stores" => "stores#index"
  get "/stores/:id" => "stores#show"

  get "/items" => "items#index"
  get "items/:id" => "items#show"

  post "/store_subscriptions" => "store_subscriptions#create"
  get "/store_subscriptions" => "store_subscriptions#show"
  delete "/store_subscriptions/:id" => "store_subscriptions#destroy"


  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/items_search" => "items#index"
  post "/items_search" => "items#index"
  get "/items/:id" => "items#show", as: :item

  get "/reviews" => "reviews#index"
  post "/reviews" => "reviews#create"

  namespace :api do
    namespace :v1 do
      get "/items" => "items#index"           
      get "/colors" => "colors#index"           
      get "/styles" => "styles#index"           
    end
  end
end
