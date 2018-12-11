class CreateExchanges < ActiveRecord::Migration[5.2]
  def change
    create_table :exchanges do |t|
      t.belongs_to :applicant_user, :class_name => 'User'
      t.belongs_to :owner_user, :class_name => 'User'
      t.belongs_to :applicant_article, :class_name => 'Article'
      t.belongs_to :owner_article, :class_name => 'Article'
      t.boolean :status

      t.timestamps
    end
  end
end
