Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
