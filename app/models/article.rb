class Article < ApplicationRecord
  belongs_to :user
 belongs_to :category
  validates :title, :description, :size, :image, presence: true
  has_one :favorite
  
  mount_uploader :image, ImageUploader
end
