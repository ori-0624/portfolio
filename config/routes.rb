Rails.application.routes.draw do
  devise_for :users, path: '', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'home#home'
  resources :user do
    resources :post, only: [:index, :new, :create, :destroy]
  end
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
