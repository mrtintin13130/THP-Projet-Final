FactoryBot.define do
  factory :user do
    first_name { "Robert"}
    last_name {"Hue"}
    email { FFaker::Internet.disposable_email }
    password {"ZEZEZE"}
  end
end
