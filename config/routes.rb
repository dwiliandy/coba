Rails.application.routes.draw do
    devise_for :users
    devise_scope :user do
      root to: "devise/sessions#new"
    end
 
    #Route Admin
    namespace :admins do
      get 'dashboard' => 'pages#index'
      resources :nama_keluargas, except: [:destroy]
      resources :anggota_keluargas_imports, only: [:new, :create]
      resources :anggota_keluargas do
        collection do
          get 'pkb'
          get 'wki'
          get 'pemuda'
          get 'remaja'
          get 'asm'
          get 'template'
        end
        member do
          patch 'set_meninggal'
        end
      end
      resources :users, only: [:edit,:update] do
        member do
          patch 'change_password'
        end
      end
      resources :koloms
      resources :keuangans
      get 'meninggal_tahun_ini' => 'data_lain_lains#meninggal_tahun_ini'
      get 'lahir_tahun_ini' => 'data_lain_lains#lahir_tahun_ini'
      get 'ulang_tahun_minggu_depan' => 'data_lain_lains#ulang_tahun_minggu_depan'
      get 'ulang_tahun_minggu_ini' => 'data_lain_lains#ulang_tahun_minggu_ini'
      
    end

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
