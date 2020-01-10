class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable, 
          :omniauthable, omniauth_providers: %i[facebook google_oauth2]



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
  


  def self.find_oauth(auth)
    #Ouath認証先で取ってきた必要な情報を取り出す
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first

    # binding.pry
    # snsの登録は終わっている状態(uid+Providerの情報がDBに存在するが、Userにあるかどうかは別問題)
    if snscredential.present?
      # SNSの登録内容に合致したユーザを調べる
      user = User.where(id: snscredential.user_id).first
      # もしこれが存在しない場合は
      unless user.present?
        # userインスタンスを新規に作成し、これらの名前とemailを流し込んであげる
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
          )
      end
      sns = snscredential
      #binding.pry
      
    else #もし、SNSの登録が終わってない場合（OAuth認証をしたことがない場合）
      # OAuth認証先のemailに対応するユーザが存在しているか（＝登録済みのemailであるか否か）
      user = User.where(email: auth.info.email).first
      # このアドレスがもし既存のユーザで登録済みのものであるならば（検索結果に引っかかったならば）
      if user.present?
        # authからの情報を含んだ新規snscredentialインスタンスを作る
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #このアドレスが正真正銘全くの初めてのアドレスなったならば
        # authからの情報を含んだ新規Userインスタンスを生成する。
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )

        # そして、このoauth認証で手に入れたデータを元にsnsインスタンスを作ってあげる
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
          )
      end
      # ここで、「snscredential」インスタンスと、これに対応する「user」インスタンスが取得できた。
    end
    # binding.pry
    # userモデルの「snscredential_id」に格納する用のidを「sns_id」という形でハッシュで返してあげる
    # 「sns.id」はsessionに保存させておいて、userを最終的に作るときにこのidに対応するsnscredentialレコードにuser.idを追加する
    return { user: user , sns_id: sns.id }
  end
end
