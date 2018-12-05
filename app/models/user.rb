class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :articles
  has_one :favorite

#  after_create :welcome_send
#  def welcome_send
#    WelcomeMailer.welcome_send(self).deliver
#  end

end
