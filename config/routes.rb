Rails.application.routes.draw do
  resources :certificates
  resources :events
  get 'certificate_templates/classic'
  get 'certificate_templates/modern'
  devise_for :users
  root 'static_pages#landing_page'
  get 'pricing', to: 'static_pages#pricing'
end
