Rails.application.routes.draw do

  root controller: :answers, action: :index

  devise_for :users
  resources :users, only:[:show] do
    member do
      get :questions
      get :answers
      get :comments
      get :favorite_users
      get :favorited_users
    end
  end

  resources :answers, only:[:index]

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

  namespace :rankings do
    get :index
    get :user
  end

end
