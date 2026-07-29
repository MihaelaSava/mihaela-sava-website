Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ro|fr/ do
    # Root page
    root "home#index"

    # Static pages
    get "about", to: "pages#about"
    get "contact", to: "pages#contact"

    # Project landing pages
    get "botany-projects", to: "botany#index"
    get "dev-projects", to: "dev#index"

    # Dev section
    get "dev/etymology", to: "dev#etymology"

    # Articles
    resources :articles, only: [ :index, :show ]

    # Health check endpoint (Kamal)
    get "/up" => proc { [ 200, {}, [ "OK" ] ] }
  end
end
