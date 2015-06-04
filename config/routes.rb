Rails.application.routes.draw do

  devise_for :users 
  devise_scope :user do
    get "sign_out", to: "devise/sessions#destroy"
    get "sign_up", to: "devise/registrations#new"
  end
  root "static_pages#home"

  get "help"=>"static_pages#help", as: :help
  get "about"=>"static_pages#about", as: :about
  get "contact"=>"static_pages#contact", as: :contact
end
