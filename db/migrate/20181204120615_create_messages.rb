class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.integer :dest_user_id

      t.timestamps
    end
  end
end
