Rails.application.routes.draw do
  resources :user_coins
  devise_for :users
  root :to => 'welcome#index'
  get 'welcome/index'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search_coin', to: 'coins#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
