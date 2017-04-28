Rails.application.routes.draw do
  get "/carted_products" => "carted_products#index"
  post "/carted_products" => "carted_products#create"
  delete "/carted_products/:id" => "carted_products#destroy"

  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"


  get "/stores" => "stores#index"
  get "/stores/:id" => "stores#show"

  post "/store_subscriptions" => "store_subscriptions#create"
  get "/store_hello" => "store_subscriptions#show"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
