class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :favorite
  
  mount_uploader :image, ImageUploader
end
