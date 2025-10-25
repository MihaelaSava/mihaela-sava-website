Rails.application.routes.draw do
  # Ruta pentru health check (folosită de Kamal)
  get "up", to: "rails/health#show", as: :up

  # Ruta principală a site-ului tău
  root "home#index"
end
