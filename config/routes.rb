Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tweets#index'
  resources :tweets do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: :create
    resource :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show

end
