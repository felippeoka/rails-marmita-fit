Rails.application.routes.draw do
  devise_for :users
  root to: "lunchboxes#index"

  resources :lunchboxes

  get 'lunchboxes/:id/purchase', to: 'purchases#purchase', as: :purchase
  get 'profile', to: 'pages#profile'

end
