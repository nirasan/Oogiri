Rails.application.routes.draw do

  root to: "questions#index"

  devise_for :users

  get 'questions/public'
  get 'answers/public'

  resources :questions do
    resources :answers
  end

end
