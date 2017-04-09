class Store < ApplicationRecord
  has_many :items
  has_many :store_subscriptions
  has_many :users, through: :store_subscriptions
end
