Rails.application.routes.draw do
  devise_for :users
  root to: "lunchboxes#index"

  resources :lunchboxes do
    resources :orders, except: :show
  end

  get 'orders/:id', to: 'orders#show', as: :order


  get 'profile', to: 'pages#profile'
  get 'lunchboxes/:id/purchase', to: 'purchases#purchase', as: :purchase
end
