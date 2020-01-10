Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  root to: "messages#index"
  resources :messages, only: [:index, :new, :create, :show, :edit, :destroy, :update]

  resources :users, only: [:show] do
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


