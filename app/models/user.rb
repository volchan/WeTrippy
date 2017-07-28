class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :phone, presence: true
  validates :description, length: { minimum: 150, maximum: 400, allow_blank: true }
  validate :password_complexity

  belongs_to :country

  def password_complexity
    return unless password.present? && !password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*(_|[^\w])).+$/)
    errors.add :password, 'must be 6 character long, must include at least one lowercase letter, one uppercase letter, one digit and one special character'
  end
end
