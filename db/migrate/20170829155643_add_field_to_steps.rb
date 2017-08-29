class AddFieldToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :steps, :address, :string
    add_column :steps, :lat, :float
    add_column :steps, :long, :float
    add_reference :steps, :country, foreign_key: true
  end
end
