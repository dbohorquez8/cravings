Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/authentications/omniauth_callbacks", :sessions => "users/sessions"}
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :mood do
    get :selection
    post :suggestion
    get :suggestion, to: redirect("/mood/selection")
  end

  resources :meals, :only => [:index, :new, :create]
  resources :users, :only => [:new]

  root to: "pages#index"
end
