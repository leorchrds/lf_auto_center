Rails.application.routes.draw do
  
  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
  end
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
    resources :clients
  end

  root to: 'site/welcome#index'

  devise_for :users
  devise_for :admins

  # Rotas de logout para usuários e administradores
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :user_logout
  end

  devise_scope :admin do
    get '/admins/sign_out', to: 'devise/sessions#destroy', as: :admin_logout
  end
end
