Rails.application.routes.draw do  
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
  resources :stores
  get "admin"=>"stores#admin", as: :admin
  get "help"=>"static_pages#help", as: :help
  get "about"=>"static_pages#about", as: :about
  get "contact"=>"static_pages#contact", as: :contact
  get "", to: "stores#show", constraints: lambda{|r| !r.subdomain.blank? && r.subdomain != "www"}  
  root "static_pages#home"
end
