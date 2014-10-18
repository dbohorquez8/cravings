Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :mood do
    resources :tags, :only => [:index]
    resources :choices, :only => [:index]
  end

  resources :meals, :only => [:new]

end
