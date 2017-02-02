Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  resources :missions do
    resources :jobs do
      resources :resumes
    end
  end

  namespace :leader do
    resources :missions do
      member do
        post :publish
        post :hide
      end
      resources :jobs do
        member do
          post :publish
          post :hide
        end
      end
    end
  end

  root 'welcome#index'
end
