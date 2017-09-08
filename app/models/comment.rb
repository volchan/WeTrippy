class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :user, presence: true, uniqueness: true
  validates :experience, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :comment, length: { minimum: 250, allow_blank: true }

  validate :checking_for_host

  private

  def checking_for_host
    return unless experience
    return unless user
    return unless experience.host == user
      errors[:user] << 'Vous ne pouvez pas commenter votre propre expèrience.'
  end
end
