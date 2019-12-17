Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: "messages#index"
  resources :messages, only: [:index, :new, :create, :show, :edit, :destroy]

  resources :users, only: [:show] 

  resources :numbers, only: [:index, :new, :create] do
    collection do
      get "get_number"
    end
  end

  resources :calenders, only: [:index]
end


