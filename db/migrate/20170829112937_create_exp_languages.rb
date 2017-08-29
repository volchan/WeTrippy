class CreateExpLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :exp_languages do |t|
      t.references :experience, foreign_key: true
      t.references :language, foreign_key: true

      t.timestamps
    end
  end
end
