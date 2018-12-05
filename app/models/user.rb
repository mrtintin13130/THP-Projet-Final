require 'nexmo'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :confirmable
  has_many :articles
  has_one :favorite
  has_many :messages
  def code_create
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
  return phone
  end

  def self.sms_send(user, phone)
    authenticate(phone)
    client = Nexmo::Client.new(api_key: "b5d67031", api_secret: "zGuhQACL1j2OsAO0")
    client.sms.send(from: "SWAT", to: phone, text: "Voici votre code secret #{user.code_confirm}")
  end
end
