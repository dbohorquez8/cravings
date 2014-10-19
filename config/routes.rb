Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/authentications/omniauth_callbacks" }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :mood do
    get :selection
    post :suggestion
  end

  resources :meals, :only => [:new]
  resources :users, :only => [:new]

  root to: "pages#index"
end
