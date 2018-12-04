class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :description
      t.string :image
      t.integer :size
      t.boolean :status
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
