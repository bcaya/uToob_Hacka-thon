class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :User, foreign_key: true
      t.belongs_to :Movie, foreign_key: true
      t.integer :user_id
      t.integer :movie_id
      t.text :body

      t.timestamps
    end
  end
end
