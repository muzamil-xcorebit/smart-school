Rails.application.routes.draw do
  devise_for :parents, controllers: { confirmations: 'parents/confirmations' }
  resources :pods
  root 'pods#index'
end
