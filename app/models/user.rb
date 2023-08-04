class User < ApplicationRecord
  # Associations between models
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  # Query Interface
  enum :role, {
    member: 0,
    admin: 1
  }
  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, format: { without: /\s/ }
  validates :username, presence: true, uniqueness: true,
                       length: { minimum: 3, maximum: 16 },
                       format: { without: /\s/ }

  validates :name, presence: true

  # Personalized Validations
end
