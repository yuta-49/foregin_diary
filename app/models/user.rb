class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.search(params)
    results = all.order(created_at: :desc)
    results = results.where('good LIKE ?', "%#{params[:search]}%") if params[:search].present?
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
  


  def self.find_for_oauth(auth)
    binding.pry
    user = User.where(uid: auth.uid, provider: auth.provider).first
    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
