## user schema informations
#  t.string "first_name"
#  t.string "last_name"
#  t.string "birth_date"
#  t.boolean "admin", default: false
#  t.boolean "premium_user", default: false
#  t.boolean "sex"
#  t.integer "code_confirm"
#  t.string "image"
#  t.string "email", default: "", null: false
#  t.string "encrypted_password", default: "", null: false
#  t.string "reset_password_token"
#  t.datetime "reset_password_sent_at"
#  t.datetime "remember_created_at"
#  t.datetime "created_at", null: false
#  t.datetime "updated_at", null: false
#  t.index ["email"], name: "index_users_on_email", unique: true
#  t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_one :favorite
  has_many :messages
end
