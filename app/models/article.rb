class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :exchanges
  mount_uploader :image, ImageUploader
   mount_uploader :video, VideoUploader
    def set_success(format, opts)
    self.success = true
  end
end
