class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :favorite
  validates :description, :size, :status, presence: true
  mount_uploader :image, ImageUploader
end
