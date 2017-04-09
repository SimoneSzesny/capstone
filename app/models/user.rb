class User < ApplicationRecord
  has_secure_password
  has_many :store_subscriptions
  has_many :stores, through: :store_subscriptions
  has_many :items 
  has_many :reviews  
end
