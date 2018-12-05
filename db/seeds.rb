# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## == User database informations ==
#  t.string "first_name"
#  t.string "last_name"
#  t.string "birth_date"
#  t.boolean "admin", default: false
#  t.boolean "premium_user", default: false
#  t.boolean "sex"
#  t.integer "code_confirm"
#  t.string "image"-
#  t.string "email", default: "", null: false

## == Article database information ==
# create_table "articles", force: :cascade do |t|
#   t.text "description"
#   t.integer "size"
#   t.boolean "status"
#   t.bigint "user_id"
#   t.bigint "category_id"
#   t.datetime "updated_at", null: false
#   t.index ["category_id"], name: "index_articles_on_category_id"
#   t.index ["user_id"], name: "index_articles_on_user_id"

User.create(first_name: 'Gilles', last_name: 'Hejonn', birth_date: '21/03/1990', admin: 'false', sex: 'Non genré.e.s', email: 'jonlajoie@mail.com')
Category.create(name: 'T-shirt')
Article.create(description: 'Article de test', size: 'M', status: true, user_id: '0', category_id: '0' )
