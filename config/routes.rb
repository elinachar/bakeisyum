Rails.application.routes.draw do
  get 'basic_pages/index'
  get 'basic_pages/about'
  get 'basic_pages/contact'
  get 'basic_pages/faq'
  root 'basic_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'basic_pages/recipies'

end
