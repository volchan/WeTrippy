class ChangeFieldNamesOfSteps < ActiveRecord::Migration[5.1]
  def change
    rename_column :steps, :lat, :latitude
    rename_column :steps, :long, :longitude
  end
end
