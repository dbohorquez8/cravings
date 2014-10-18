Rails.application.routes.draw do
  
  namespace :mood do
    resources :tags, :only => [:index]
    resources :choices, :only => [:index]
  end

  resources :meals, :only => [:new]

end
