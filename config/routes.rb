Rails.application.routes.draw do
  devise_for :users
  root to: "lunchboxes#index"

  resources :lunchboxes do
    resources :orders
  end


  get 'profile', to: 'pages#profile'
  get 'lunchboxes/:id/purchase', to: 'purchases#purchase', as: :purchase
end
