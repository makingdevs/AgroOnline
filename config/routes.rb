Rails.application.routes.draw do
  resources :users
  resources :addresses
  resources :categories
  resources :providers
  resources :products

  root 'welcome#index'

  get '/provider/multi/', to: 'providers#multi', as: 'multiProviders'
  post '/provider/save/', to: 'providers#save', as: 'saveProviders'

  get "/categories/search/:id", to: 'categories#search', as: 'categorySearch'
  get "/product/search/:id", to: 'products#search', as: 'product_search'
  post "/provider/contact/:id", to: 'mailer#contact', as: 'provider_contact'
  post "/product/category/state", to: 'welcome#search', as: 'state_search_categories'
  get "/product/contact", to: 'products#contact', as: 'product_provider_contact'

  get "/welcome/our", to: 'welcome#our', as: 'welcome_out'

  get "/login", to: 'users#login', as: 'login'
  post "/login_attempt", to: 'users#login_attempt', as: 'login_attempt'
  get "/logout", to: 'users#logout', as: 'logout'

  post "/provider/saveImage", to: 'providers#save_image', as: 'provider_image'

  get "/profile/:id", to: 'providers#show', as: 'profile'
  get "/provider/product/:id", to: 'products#providerProducts', as: 'products_provider'
  get "/product/new/:id", to: 'products#new', as: 'new_product_provider'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
