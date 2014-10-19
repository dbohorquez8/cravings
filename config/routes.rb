Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :mood do
    get :selection
    post :suggestion
  end

  resources :meals, :only => [:new]

  get "main" => "pages#index"
  root to: "mood#selection"
end
