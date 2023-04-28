Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: "top#index"
  resources :groups, only: [:index, :new, :create] do
    member do
      get 'join'
    end
    resources :posts, only: [:index]
  end
end
