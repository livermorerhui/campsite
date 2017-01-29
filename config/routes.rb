Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'missions#index'
  resources :missions
  
  namespace :admin do
    resources :missions
  end

end
