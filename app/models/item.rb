class Item < ApplicationRecord
  belongs_to :store
  belongs_to :user
  has_many :reviews 
  has_many :images
end
