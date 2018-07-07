Rails.application.routes.draw do
  get 'homes/show'
  resources :recipes
  get 'basic_pages/index'
  get 'basic_pages/about'
  get 'basic_pages/contact'
  get 'basic_pages/faq'
  post 'basic_pages/thank_you'
  root 'basic_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
