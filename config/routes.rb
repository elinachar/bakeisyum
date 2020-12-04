Rails.application.routes.draw do
  # scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    localized do
      devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'sign-up'}, controllers: { registrations: "user_registrations" }

      resources :users do
        resources :favorites
      end

      resources :recipes do
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
      get :send_new_recipe_email, to: 'subscriptions#send_new_recipe_email', as: :send_new_recipe_email

      get 'basic_pages/index'
      get 'about', to: 'basic_pages#about'
      get 'contact', to: 'basic_pages#contact'
      post 'thank-you', to: 'basic_pages#thank_you'
      get 'privacy-policy', to: 'basic_pages#privacy_policy'
      get 'terms-and-conditions', to: 'basic_pages#terms_and_conditions'
      # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # end
  end
  root 'basic_pages#index'

  scope "/:locale" do
    get "/", to: "basic_pages#index", as: :locale_root
  end


end
