Rails.application.routes.draw do

  devise_for :users
  # root 'welcome#index'
resources :recipes
root "recipes#index"
end
