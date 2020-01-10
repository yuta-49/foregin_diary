class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end


  def callback_from(provider)

    info = User.find_oauth(request.env["omniauth.auth"])
    @user = info[:user]
    sns_id = info[:sns_id]
    if @user.persisted? #userがsave済みであれば
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else #userがsaveされてないインスタンスの場合は
      session["devise.sns_id"] = sns_id
      @password = Devise.friendly_token[0,20]
      render registration_sns_signup_index_path
    end
  end
  
  def failure
    redirect_to root_path and return
  end
end