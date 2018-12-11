class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.integer :applicant_user_id
      t.integer :owner_user_id
      t.integer :applicant_article_id
      t.integer :owner_article_id
      t.boolean :applicant_status
      t.boolean :owner_status

      t.timestamps
    end
  end
end
