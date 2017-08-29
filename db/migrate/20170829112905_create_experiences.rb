class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.references :host
      t.references :category, foreign_key: true
      t.boolean :solidary
      t.integer :slots
      t.string :address
      t.float :lat
      t.float :long
      t.string :title
      t.text :description
      t.integer :type
      t.string :slogan

      t.timestamps
    end
  end
end
