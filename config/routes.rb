Rails.application.routes.draw do
  
  namespace :mood do
    resources :tags, :only => [:index]
  end

end
