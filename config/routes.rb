Rails.application.routes.draw do
  
  root 'lists#index'
  post "/", to: "lists#create"
  post "/lists/:id", to: "tasks#create"

  resources :lists do 
    resources :tasks do
      member do 
        patch :complete
      end
    end
  end

end
