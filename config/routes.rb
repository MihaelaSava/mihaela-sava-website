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

  # Botany section
  namespace :botany do
    get "prevernal-flora", to: "pages#prevernal_flora"
    get "vernal-flora", to: "pages#vernal_flora"
    get "estival-flora", to: "pages#estival_flora"
    get "autumnal-flora", to: "pages#autumnal_flora"
    get "hiemal-flora", to: "pages#hiemal_flora"
  end

  # Articles
  resources :articles, only: [ :index, :show ]

  # Health check endpoint (Kamal)
  get "/up" => proc { [ 200, {}, [ "OK" ] ] }
end
