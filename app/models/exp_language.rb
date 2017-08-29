class ExpLanguage < ApplicationRecord
  belongs_to :experience
  belongs_to :language

  validates :experience, presence: true
  validates :language, presence: true
end
