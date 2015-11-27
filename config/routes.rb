Rails.application.routes.draw do
  resources :items
  resources :roles
  devise_for :users
  scope "/admin" do
    resources :users
  end
  authenticated :user do
    root :to => 'items#index', as: :authenticated_root
  end
  root :to => 'welcome#index'
end
