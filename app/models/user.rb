require 'nexmo'
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :articles
  has_one :favorite

def numtransform
b = User.last
  if b.phone[0, 2] == "06" || b.phone[0, 2] == "07"
        b.phone = "33" + b.phone
        b.phone.slice!(2)
  end
  b.save
  return b
end
after_create :numtransform
def sms_send
  b = numtransform
  client = Nexmo::Client.new(
  api_key: "b5d67031",
  api_secret: "zGuhQACL1j2OsAO0"
  )
if b.phone[0, 3] == "336" || b.phone[0, 3] == "337"
  client.sms.send(
  from: "SWAT",
  to: b.phone,
  text: "Bienvenue sur notre super site"
  )
else
  puts "ntr c pa valid"
end
end

after_create :sms_send

end
