Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :gyms do
    resources :memberships, only: [:create]
  end

  resources :clients

  resources :memberships, only: [:destroy]

  get '/gyms/:id', to: 'gyms#show'
  delete '/gyms/:id', to: 'gyms#destroy'
  get '/clients/:id', to: 'clients#show'
end
