require 'rails_helper'

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

RSpec.describe Article, type: :model do
  context 'validation tests' do

    it 'ensures article description presence' do
      art = article.new(size: M, status: true, user_id: ???, category_id: ???).save
      expect(art).to eq(false)
    end

    it 'ensures article size presence' do
      art = article.new(description: "This is a test, nice to meet You.", size: M, status: true, user_id: ???, category_id: ???).save
      expect(art).to eq(false)
    end

    it 'ensures article status presence' do
      art = article.new(description: "This is a test, nice to meet You.", size: M, status: true, user_id: ???, category_id: ???).save
      expect(art).to eq(false)
    end

    it 'ensures article user presence' do
      art = article.new(description: "This is a test, nice to meet You.", size: M, status: true, user_id: ???, category_id: ???).save
      expect(art).to eq(false)
    end

    it 'ensures article category présence' do
      art = article.new(description: "This is a test, nice to meet You.", size: M, status: true, user_id: ???, category_id: ???).save
      expect(art).to eq(false)
    end

  end
  context 'scope tests' do

  end
end
