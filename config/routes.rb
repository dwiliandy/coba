Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#index'
end
