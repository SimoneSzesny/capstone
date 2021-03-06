class User < ApplicationRecord
  has_secure_password
  has_many :store_subscriptions
  has_many :stores, through: :store_subscriptions
  # has_many :items
  has_many :reviews  
  has_many :orders
  has_many :carted_products
  has_many :items, through: :stores
  
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
