Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'missions#index'
  resources :missions do
    resources :jobs
  end

  namespace :admin do
    resources :missions
    resources :jobs
  end

end
