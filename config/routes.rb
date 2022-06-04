Rails.application.routes.draw do
  resources :certificates, only: :show
  resources :events do
    member do
      # get :export
      post :import_certs
    end
  end
  get 'certificate_templates/classic'
  get 'certificate_templates/modern'
  get 'certificate_templates/language_certificate'
  devise_for :users
  root 'static_pages#landing_page'
  get 'pricing', to: 'static_pages#pricing'
end
