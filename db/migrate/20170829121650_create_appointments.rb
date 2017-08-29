class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :experience, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
