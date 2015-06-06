Rails.application.routes.draw do

  root to: 'answers#index'

  devise_for :users
  resources :users, only:[:show] do
    member do
      get 'questions'
      get 'answers'
      get 'comments'
    end
  end

  get 'answers', to: 'answers#index'

  resources :questions do
    resources :answers, except:[:index] do
      resources :comments, except:[:index, :show]
    end
  end

end
