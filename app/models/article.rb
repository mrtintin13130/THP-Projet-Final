class Article < ApplicationRecord
  
  
  has_one :favorite
  
  mount_uploader :image, ImageUploader
end
