class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :size
      t.boolean :status
      t.belongs_to :user
      t.belongs_to :category
      t.string :image

      t.timestamps
    end


  end
end
