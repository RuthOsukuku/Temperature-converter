Rails.application.routes.draw do
  # Route for the temperature conversion endpoint
  post 'tempconvert.asmx', to: 'temperature_converter#convert'
  
  # Additional routes if needed
end
