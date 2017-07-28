class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :date
    add_reference :users, :country, foreign_key: true
    add_column :users, :phone, :string
    add_column :users, :description, :text
    add_column :users, :address, :string
    add_column :users, :sex, :integer
    add_column :users, :hobbies, :text
    add_column :users, :privileges, :integer
  end
end
