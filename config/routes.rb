Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#landing_page'
  get 'pricing', to: 'static_pages#pricing'
end
