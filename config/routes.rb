Rails.application.routes.draw do

  # root 'welcome#index'
resources :recipes
root "recipes#index"
end
