Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "messages#index"
  resources :messages, only: [:index, :new, :create, :show, :edit, :destroy, :update]

  resources :users, only: [:show] do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
    collection do
      get 'mypage_search'
      get 'search_result'
    end
  end

  resources :numbers, only: [:index, :new, :create] do
    collection do
      get "get_number"
    end
  end

  resources :calenders, only: [:index, :new, :create, :destroy]
end


