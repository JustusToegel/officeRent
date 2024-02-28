class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flats
  has_many :bookings, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password, length: { minimum: 5 }
end
