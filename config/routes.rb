Rails.application.routes.draw do
  # mount Blazer::Engine, at: "blazer"
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/teams/:id/staff", to: "teams#staff", as: "staff"
  get "/teams/:id/management", to: "teams#management", as: "management"
  get "/teams/:id/chat", to: "teams#chat", as: "chat"

  resources :teams, only: :show do
    resources :events, except: :destroy
    resources :players, except: :destroy
    resources :employees, except: :destroy
  end
end
