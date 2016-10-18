Rails.application.routes.draw do
  devise_for :users
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
  post "/search", to: 'welcome#search', as: 'search'
  get "/product/contact", to: 'products#contact', as: 'product_provider_contact'

  get "/welcome/our", to: 'welcome#our', as: 'welcome_out'


  post "/provider/saveImage", to: 'providers#save_image', as: 'provider_image'

  get "/profile/:id", to: 'providers#show', as: 'profile'
  get "/provider/product/:id", to: 'products#providerProducts', as: 'products_provider'
  get "/product/new/:id", to: 'products#new', as: 'new_product_provider'

  post "/product/image/:id", to: 'products#image', as: 'product_image'

  get "/contact", to:"welcome#contact", as: 'contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
