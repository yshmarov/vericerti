Rails.application.routes.draw do
  resources :certificates, only: :show
  resources :events do
    member do
      post :import_certs
    end
  end

  devise_for :users
  root 'static_pages#landing_page'

  get 'pricing', to: 'static_pages#pricing'

  get 'certificate_templates/classic'
  get 'certificate_templates/modern'
  get 'certificate_templates/language_certificate'
end
