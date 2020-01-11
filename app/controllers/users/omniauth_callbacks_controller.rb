class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end


  def callback_for(provider)

    info = User.find_oauth(request.env["omniauth.auth"])
    @user = info[:user]
    sns_id = info[:sns_id]
    if @user.persisted? #userがsave済みであれば
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else #userがsaveされてないインスタンスの場合は
      session["devise.sns_id"] = sns_id
      @password = Devise.friendly_token[0,20]
      redirect_to root_path
    end
  end
  
  def failure
    redirect_to root_path and return
  end
end