Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET'],{:provider_ignores_state => true}
    # scope: 'email', display: 'popup', local: 'ja_JP', info_fields: "id, name, gender"
  
end