class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :exchanges
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy


end
