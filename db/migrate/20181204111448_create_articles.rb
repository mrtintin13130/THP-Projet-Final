class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.integer :size
      t.boolean :status
      t.belongs_to :user
      t.belongs_to :category
      t.string :image
      t.string :video
      

      t.timestamps
    end
  end
end
