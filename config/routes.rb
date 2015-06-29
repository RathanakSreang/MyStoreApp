Rails.application.routes.draw do 
  mount Ckeditor::Engine => '/ckeditor'
  namespace :admin do  
    # resources :products
    resources :store_logos
    resources :abouts, only: [:update]
    get "stores_abouts", to: "abouts#show"
    get "edit_stores_abouts", to: "abouts#edit"
    resources :addresses, only: [:update]
    get "stores_addresses", to: "addresses#show"
    get "edit_stores_addresses", to: "addresses#edit"
    resources :stores, only: [:update, :destory]
    get "stores_setting", to: "stores#show"
    get "edit_stores_setting", to: "stores#edit"
    get "", to: "stores#show"    
  end

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
  get "help"=>"static_pages#help", as: :help
  get "about"=>"static_pages#about", as: :about
  get "contact"=>"static_pages#contact", as: :contact
  get "", to: "stores#show", constraints: lambda{|r| !r.subdomain.blank? && r.subdomain != "www"}  
  root "static_pages#home"
end
