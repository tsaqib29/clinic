Rails.application.routes.draw do
  get "finance/index"
  get "calendar", to: "calendar#index"

  root "home#index"

  devise_for :admin_users

  namespace :admin do
    root "dashboard#index"

    resources :patients do
      resources :visits
    end

    resources :visits
    get "finance", to: "finance#index"

    resources :appointments
  end


  resources :appointments

  get "up" => "rails/health#show", as: :rails_health_check
end
