Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      root "todos#index", as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  devise_for :users

  namespace :admin do
    resources :activity_logs, only: %i(index show)
  end

  resources :todos
end
