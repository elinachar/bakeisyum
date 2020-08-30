Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}, controllers: { registrations: "user_registrations" }

  resources :users do
    resources :favorites
  end

  resources :recipes, param: :name do
    resources :ratings
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
  get 'about', to: 'basic_pages#about'
  get 'contact', to: 'basic_pages#contact'
  post 'thank_you', to: 'basic_pages#thank_you'
  get 'privacy_policy', to: 'basic_pages#privacy_policy'
  get 'terms_and_conditions', to: 'basic_pages#terms_and_conditions'
  root 'basic_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
