class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.belongs_to :user, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
