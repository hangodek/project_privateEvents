Rails.application.routes.draw do
  resources :homepages, only: [ :index ]
  resources :registers, only: [ :new, :create ]
  resources :events, only: [ :index, :new, :create, :destroy ] do
    member do
      post "attend", to: "events#attend"
      delete "unattend", to: "events#unattend"
    end
  end
  resource :session
  resources :passwords, param: :token
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  root "homepages#index"
end
