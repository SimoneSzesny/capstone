class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :items, through: :carted_products
  belongs_to :item
end
