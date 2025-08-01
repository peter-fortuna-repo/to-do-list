Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: %i[new create], path: "signup", path_names: {new: ""}
  resources :tasks, only: %i[index create update destroy]
  resources :sessions, only: %i[new create], path: "login", path_names: {new: ""}
  resource :session, only: %i[destroy], path: "logout"

end
