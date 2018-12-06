require 'rails_helper'

## == User database informations ==
#
# Table name: users
#
#  t.string "first_name"
#  t.string "last_name"
#  t.string "birth_date"
#  t.boolean "admin", default: false
#  t.boolean "premium_user", default: false
#  t.boolean "sex"
#  t.integer "code_confirm"
#  t.string "image"-
#  t.string "email", default: "", null: false
# t.string "encrypted_password", default: "", null: false
# t.string "reset_password_token"
# t.datetime "reset_password_sent_at"
# t.datetime "remember_created_at"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["email"], name: "index_users_on_email", unique: true
# t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

RSpec.describe User, type: :model do

  context 'validation tests' do

    it 'It should save' do
    art = User.new(first_name: 'Bobby', last_name: 'Lajoie', birth_date: '02/03/89', sex: false, email: 'bobbylajoie@mail.com', password: "ZEZEZE"  ).save
    expect(art).to eq(true)
    end

    it 'It should not save without mail' do
    art = User.new(first_name: 'Bobby', last_name: 'Lajoie', birth_date: '02/03/89', sex: false, password: "ZEZEZE"  ).save
    expect(art).to eq(false)
    end

    it 'It should not save without password' do
    art = User.new(first_name: 'Bobby', last_name: 'Lajoie', birth_date: '02/03/89', sex: false, email: 'bobbylajoie@mail.com' ).save
    expect(art).to eq(false)
    end

    it 'It should not save without first_name' do
    art = User.new(last_name: 'Lajoie', birth_date: '02/03/89', sex: false, email: 'bobbylajoie@mail.com', password: "ZEZEZE"  ).save
    expect(art).to eq(false)
    end

    it 'It should not save without last_name' do
    art = User.new(first_name: 'Bobby', birth_date: '02/03/89', sex: false, email: 'bobbylajoie@mail.com', password: "ZEZEZE"  ).save
    expect(art).to eq(false)
    end
  end


end
