Rails.application.routes.draw do

  root to: 'answers#index'

  devise_for :users
  resources :users, only:[:show] do
    member do
      get 'questions'
      get 'answers'
      get 'comments'
      get 'favorite_users'
      get 'favorited_users'
    end
  end

  get 'answers', to: 'answers#index'

  resources :questions, only:[:index, :show] do
    resources :answers, only:[:show]
  end

  namespace :user do
    resources :questions, only:[:new, :edit, :create, :update, :destroy] do
      resources :answers, only:[:new, :edit, :create, :update, :destroy] do
        resources :comments, only:[:create, :update, :destroy]
      end
    end
    resources :favorites, only:[:create, :destroy]
  end

  get 'rankings/index'
  get 'rankings/user'

end
