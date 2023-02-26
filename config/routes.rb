Rails.application.routes.draw do
  devise_for :admin_users, controllers: {
    registrations: "admin_users/registrations",
    sessions: "admin_users/sessions",
    passwords: "admin_users/passwords",
    confirmations: "admin_users/confirmations"
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "site#home"

  namespace :admin_pages, path: 'admin' do
    resources :home, only: %w[index], controller: 'home', path: '/'
  end
end
