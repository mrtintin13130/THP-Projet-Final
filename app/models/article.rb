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

  validates :description, presence: true
  validates :size, presence: true
  validates :status, presence: true
  validates :status, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true

end
