Rails.application.routes.draw do
  
  resources :enrollments
  devise_for :users
  resources :courses do
    resources :lessons
  end
  resources :users, only: [:index, :edit, :update, :show]
  get 'home/index'
  get 'home/activity'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "home#index"
end
