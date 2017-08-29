class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :user, presence: true
  validates :experience, presence: true
end
