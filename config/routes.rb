Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/", to: "main#index"
  get "/random", to:"random#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
