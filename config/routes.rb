Rails.application.routes.draw do
  # Root page
  root "home#index"

  # Static pages
  get "about", to: "pages#about"
  get "botany-projects", to: "pages#botany_projects"
  get "dev-projects", to: "pages#dev_projects"
  get "contact", to: "pages#contact"

  # Articles
  resources :articles, only: [ :index, :show ]

  # Health check endpoint for Kamal
  get "/up" => proc { [ 200, {}, [ "OK" ] ] }
end
