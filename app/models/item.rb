class Item < ApplicationRecord
  belongs_to :store
  # belongs_to :user
  has_many :reviews 
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :orders
  belongs_to :style
end
