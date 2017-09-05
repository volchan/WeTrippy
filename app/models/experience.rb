class Experience < ApplicationRecord
  has_many :steps
  has_many :appointments
  has_many :exp_languages

  belongs_to :host, class_name: :User, foreign_key: :host_id
  belongs_to :category

  validates :slots, presence: true, numericality: true
  validates :title, presence: true
  validates :host, presence: true
  validates :category, presence: true
  validates :description, length: { minimum: 200, maximum: 800 }
  validates :slogan, length: { minimum: 1, maximum: 60 }

  has_attachment :cover
  has_attachments :photos, maximum: 4

  monetize :price_cents
end
