Rails.application.routes.draw do
  devise_for :parents, controllers: { confirmations: 'parents/confirmations' }
  root 'pods#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
