Rails.application.routes.draw do
  resources :descriptions
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "user_registrations" }

  resources :users

  resources :recipes, param: :name do
    resources :descriptions
    resources :comments do
      put :approve
    end
  end

  resources :subscriptions do
    collection do
      get :unsubscribe # http://example.com/subscriptions/unsubscribe?token=xxxxxx
    end
  end

  get 'homes/show'
  get 'basic_pages/index'
  get 'basic_pages/about'
  get 'basic_pages/contact'
  get 'basic_pages/faq'
  post 'basic_pages/thank_you'
  root 'basic_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
