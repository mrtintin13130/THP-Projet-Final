## == database Schemas.rb information ==
# create_table "articles", force: :cascade do |t|
#   t.text "description"
#   t.integer "size"
#   t.boolean "status"
#   t.bigint "user_id"
#   t.bigint "category_id"
#   t.datetime "updated_at", null: false
#   t.index ["category_id"], name: "index_articles_on_category_id"
#   t.index ["user_id"], name: "index_articles_on_user_id"

class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :favorite
  has_many :exchanges
end
