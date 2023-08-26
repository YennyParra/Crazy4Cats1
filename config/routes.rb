Rails.application.routes.draw do
  resources :articles
  devise_for :catusers
  post 'new_catuser_reaction', to:"reactions#new_catuser_reaction", as: "new_catuser_reaction"
   resources :catcomments, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
