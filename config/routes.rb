Rails.application.routes.draw do
  devise_for :users

  root 'questions#index'
  resources :questions do
    member do
      post :answer
    end
  end

   scope path: :follows, as: :follow, controller: :follows do
    get :user
    get :topic
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
