class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.belongs_to :main_user, :class_name => 'User'
      t.belongs_to :favorite_user, :class_name => 'User'

      t.timestamps
    end
  end
end
