class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #  :recoverable, :rememberable, :validatable
  # Authentication
  has_secure_password
  # Associations between models
  has_many :likes, dependent: :destroy
  has_many :tweets, dependent: :destroy
  # Query Interface
  enum :role, {
    member: 0,
    admin: 1
  }
  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true, length: { minimum: 6 }, format: { without: /\s/ }
  validates :username, presence: true, uniqueness: true,
                       length: { minimum: 3, maximum: 16 },
                       format: { without: /\s/ }

  validates :name, presence: true

  # # Actives Storage
  has_one_attached :avatar
end
