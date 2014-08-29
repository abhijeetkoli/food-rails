Rails.application.routes.draw do
  root to: 'landing#index'

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_scope :user do
    get 'login', to: 'devise/sessions#create', as: 'login'
    get 'signout', to: 'devise/sessions#destroy', as: 'signout'
    post 'invite', to: 'mailer#invite', as: 'invite'
    post 'welcome', to: 'mailer#welcome', as: 'welcome'
  end

  get 'opensource', to: 'opensource#index', as: 'opensource'

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        resources :derivation_codes, :devices, :food_data_sources, :food_groups, :food_nutrients, :food_sources, :foods, :nutrients, :source_codes, :weights
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end
    end
  end

end
