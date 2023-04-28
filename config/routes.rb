Rails.application.routes.draw do
  get 'posts/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "top#index"
  resources :groups, only: [:index, :new, :create] do
    
    resources :posts, only: [:index]
  end
end
