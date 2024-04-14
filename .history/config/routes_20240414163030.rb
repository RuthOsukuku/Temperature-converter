Rails.application.routes.draw do
  get 'temperature_converter/convert'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define the route for tempconvert.asmx
  match 'tempconvert.asmx', to: 'temperature_converter#convert', via: [:get, :post]

  # Defines the root path route ("/")
  # root "posts#index"
end
