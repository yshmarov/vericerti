Rails.application.routes.draw do
  get 'certificate_templates/classic'
  get 'certificate_templates/modern'
  devise_for :users
  root 'static_pages#landing_page'
  get 'pricing', to: 'static_pages#pricing'
end
