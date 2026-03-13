Rails.application.routes.draw do
  get "finance/index"
  namespace :admin do
    get "dashboard/index"
  end

  root "home#index"

  resources :patients do
    resources :visits
  end

  devise_for :admin_users

  get "finance", to: "finance#index"

  namespace :admin do
    root "dashboard#index"
  end

  get "tomorrow_visits", to: "visits#tomorrow"

  get "up" => "rails/health#show", as: :rails_health_check
end
