class Step < ApplicationRecord
  belongs_to :experience
  belongs_to :country

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :address, presence: true
  validates :experience, presence: true
  validates :country, presence: true

  validate :check_start_time
  validate :check_end_time

  def check_start_time
    return if start_at.present? && (start_at > Time.zone.now)
    errors.add :start_at, 'Veuillez renseigner une date valide.'
  end

  def check_end_time
    return if start_at.present? && end_at.present? && (end_at > start_at)
    errors.add :end_at, 'Veuillez renseigner une date valide.'
  end
end
