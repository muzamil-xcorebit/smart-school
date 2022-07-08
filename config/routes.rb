Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :parents, controllers: { confirmations: 'parents/confirmations' }
  resources :pods
  resources :parents do
    resources :children, shallow: true
  end
  resources :child_pods
  root 'pods#index'
end
