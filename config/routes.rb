Rails.application.routes.draw do
  devise_for :parents, controllers: { confirmations: 'parents/confirmations' }
  resources :pods
  resources :parents do
    resources :children, shallow: true
  end
  root 'pods#index'
end
