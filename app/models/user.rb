require 'nexmo'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable#, :confirmable
  has_many :articles
  has_many :favorites
  has_many :messages
  has_many :exchanges

  mount_uploader :avatar, AvatarUploader

  def self.code_create(user)
    if user.code_confirm == nil || user.updated_at < DateTime.now - 1.minutes
      user.code_confirm = rand(1000..9999)
      user.save
    end
    if @text.to_i == user.code_confirm
      user.phone_verified = true
      user.save
    end
  end

  def self.authenticate(phone)
    if phone[0, 2] == "06" || phone[0, 2] == "07"
      phone = "33" + phone
      phone.slice!(2)
    end
    phone_indent = phone
  return phone_indent
  end

  def self.sms_send(user, phone)
    phone_indent = authenticate(phone)
    code_create(user)
    client = Nexmo::Client.new(api_key: ENV['NEXMO_API_KEY'], api_secret: ENV['NEXMO_API_SECRET'])
    client.sms.send(from: "SWAT", to: phone_indent, text: "Voici votre code secret #{user.code_confirm}")
  end
end
