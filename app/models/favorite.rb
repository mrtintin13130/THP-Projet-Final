class Favorite < ApplicationRecord
  belongs_to :main_user, :class_name => 'User'
  belongs_to :favorite_user, :class_name => 'User'
  validates_uniqueness_of :main_user_id, :scope => :favorite_user_id
end
