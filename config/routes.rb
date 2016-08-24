Rails.application.routes.draw do
  resources :rain_data
  root "rain_data#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
