Rails.application.routes.draw do
  resources :categories
  resources :providers
  resources :products

  root 'welcome#index'

  get '/provider/multi/', to: 'providers#multi', as: 'multiProviders'
  post '/provider/save/', to: 'providers#save', as: 'saveProviders'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
