Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :missions do
    resources :jobs
  end

  namespace :leader do
    resources :missions do
      resources :jobs
    end
  end

  root 'missions#index'
end
