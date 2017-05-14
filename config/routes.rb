Rails.application.routes.draw do
  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"


  get "/stores" => "stores#index"
  get "/stores/:id" => "stores#show"

  get "items/:id" => "items#show"

  post "/store_subscriptions" => "store_subscriptions#create"
  get "/store_subscriptions" => "store_subscriptions#show"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "/items_search" => "items#index"
  post "/items_search" => "items#index"
  get "/items/:id" => "items#show"
end
