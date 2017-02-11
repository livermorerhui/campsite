Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

############     以下是招聘功能     ################################################################

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
        resources :resumes
      end
    end
  end

############     以下是商店功能     ################################################################

  namespace :seller do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end

  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :cart_items

  resources :orders

  namespace :buyer do
    resources :orders
  end

############     以下是根页面     ################################################################

  root 'welcome#index'
end
