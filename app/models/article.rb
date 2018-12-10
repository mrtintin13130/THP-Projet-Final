class Article < ApplicationRecord
  belongs_to :user
  has_one :category
  
  has_one :favorite
  
  mount_uploader :image, ImageUploader
end
