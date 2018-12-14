class Exchange < ApplicationRecord
  belongs_to :applicant_user, :class_name => 'User'
  belongs_to :owner_user, :class_name => 'User'
  belongs_to :applicant_article, :class_name => 'Article'
  belongs_to :owner_article, :class_name => 'Article'
end
