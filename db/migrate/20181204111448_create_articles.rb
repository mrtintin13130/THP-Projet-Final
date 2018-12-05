class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :description
      
      t.integer :size
      t.boolean :status, default: true
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
