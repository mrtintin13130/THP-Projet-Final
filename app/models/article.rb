class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :exchanges
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy

  validates :title,  presence: true, length: { maximum: 10 }
  validates :size,  presence: true, length: { maximum: 5 }
  validates :description,  presence: true, length: { minimum:10, maximum: 30 }
  validates :image,  presence: true
end
