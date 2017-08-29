class AddFieldToLanguages < ActiveRecord::Migration[5.1]
  def change
    add_column :languages, :slug, :string
  end
end
