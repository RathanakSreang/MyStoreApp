Rails.application.routes.draw do

  root "static_pages#home"
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks",
                                  passwords: "passwords",
                                  sessions: "sessions",
                                  confirmations: "confirmations",
                                  registrations: "registrations"
                                  }
  devise_scope :user do
    get "sign_out", to: "devise/sessions#destroy"
    get "sign_up", to: "devise/registrations#new"
  end
  resources :users  
  get "help"=>"static_pages#help", as: :help
  get "about"=>"static_pages#about", as: :about
  get "contact"=>"static_pages#contact", as: :contact
end
