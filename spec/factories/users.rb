FactoryBot.define do
  factory :user do
    email { FFaker::Internet.disposable_email }
    password {Devise.friendly_token.first(8)}
  end
end
