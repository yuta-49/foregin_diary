class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  def self.search(search) 
    if search
      where(['messagegood LIKE ?', "%#{search}%"]) #検索とmessageの部分一致を表示。
    else
      all #全て表示させる
    end
  end

  has_many :messages
  has_many :days
  has_many :months
  has_many :numbers
  has_many :calenders

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :nickname, presence: true, length: { maximum: 6 }
end
