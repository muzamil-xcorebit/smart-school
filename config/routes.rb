Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :parents, controllers: { confirmations: 'parents/confirmations' }
  resources :pods do
    resources :reviews
  end
  resources :parents do
    resources :children, shallow: true
  end
  resources :child_pods
  resources :teachers
  root 'pods#index'
end
