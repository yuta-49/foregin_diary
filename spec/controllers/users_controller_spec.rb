require 'rails_helper'

before do
  # ユーザー作成
  @user = create(:user)

  # サインイン
  sign_in @user
end

after do
  # サインアウト
  sign_out @user
end