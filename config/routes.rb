Rails.application.routes.draw do
  # Root page
  root "home#index"

  # Static pages
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  # Project landing pages
  get "botany-projects", to: "botany/pages#index"
  get "dev-projects", to: "dev/pages#index"

  # Dev section
  namespace :dev do
    get "etymology", to: "pages#etymology"
  end

  # Botany section (reserved for future expansion)
  namespace :botany do
    # get "plants", to: "pages#plants"
  end

  # Articles
  resources :articles, only: [ :index, :show ]

  # Health check endpoint (Kamal)
  get "/up" => proc { [ 200, {}, [ "OK" ] ] }
end
