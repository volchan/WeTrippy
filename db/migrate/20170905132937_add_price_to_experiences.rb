class AddPriceToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_monetize :experiences, :price, currency: { present: false }
  end
end
