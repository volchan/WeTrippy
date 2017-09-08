class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :experience, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
