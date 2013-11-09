CoachBookings::Application.routes.draw do
  root to: "users#index"

  resources :users, only: [:create, :index]
end
