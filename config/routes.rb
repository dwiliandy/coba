Rails.application.routes.draw do
    devise_for :users 
    devise_scope :user do
      root to: "devise/sessions#new"
    end
    resources :users, only: [:edit,:update]
    resources :koloms
    resources :nama_keluargas
    resources :anggota_keluargas do
      collection do
        get 'pkb'
        get 'wki'
        get 'pemuda'
        get 'remaja'
        get 'asm'
        get 'ulang_tahun_minggu_ini'
        get 'ulang_tahun_minggu_depan'
        get 'lahir_tahun_ini'
        get 'meninggal_tahun_ini'
        get 'template'
      end
      member do
        patch 'set_meninggal'
      end
    end

    resources :anggota_keluargas_imports, only: [:new, :create]


    match "/404", to: "errors#not_found", via: :all
    match "/500", to: "errors#internal_server_error", via: :all
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get '/dashboard', to: 'pages#index' 
end
