Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "messages#index"
  resources :messages, only: [:index, :new, :create, :show]
  resources :datas, only: [:index, :new, :create]
end

