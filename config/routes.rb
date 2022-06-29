Rails.application.routes.draw do
  
  # /buildings/1/apartments/2
  resources :buildings do
    resources :apartments
  end

  root 'buildings#index'
end
