class Language < ApplicationRecord
  has_many :user_languages
  has_many :exp_languages

  validates :name, presence: true
end
