class RemoveFieldsFromExperiences < ActiveRecord::Migration[5.1]
  def change
    remove_column :experiences, :address, :string
    remove_column :experiences, :lat, :float
    remove_column :experiences, :long, :float
  end
end
