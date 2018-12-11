class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :size
      t.boolean :status, default: true
      t.belongs_to :user, index: true
      t.belongs_to :category
      t.string :image

      t.timestamps
    end
  end
end
