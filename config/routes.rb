Rails.application.routes.draw do
  resources :pay_periods
  resources :employees
  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end
  resources :employers
  resources :relationships
  resources :schedule_entries
  resources :priveleges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
