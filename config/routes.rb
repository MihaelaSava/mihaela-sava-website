Rails.application.routes.draw do
  # Healthcheck endpoint for Kamal
  get "/up" => proc { [ 200, {}, [ "OK" ] ] }

  root "home#index"
end
