class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :days
  has_many :months
  has_many :numbers
  has_many :calenders

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
