class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, 
          :omniauthable, :omniauth_providers => [:facebook]



  def self.search(params)
    results = all.order(created_at: :desc)
    results = results.where('good LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  has_many :messages
  has_many :days
  has_many :months
  has_many :numbers
  has_many :calenders
  has_one :sns_credential, dependent: :destroy

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :nickname, presence: true, length: { maximum: 6 }
  


  def self.find_for_oauth(auth)
    #Ouath認証先で取ってきた必要な情報を取り出す
    uid = auth.uid
    provider = auth.provider
    user = User.where(uid: auth.uid, provider: auth.provider).first

    binding.pry
    unless user
      user = User.create(
        nickname: auth.info.name,
        email: auth.info.email
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
