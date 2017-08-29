class Country < ApplicationRecord
  has_many :users
  has_many :steps

  validates :name, presence: true
  validates :slug, presence: true
end
