Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  root to: 'home#index'

  resources :books do
    get :published_index, on: :collection
    get :subscribed_index, on: :collection
    get :subscribe, on: :member
    get :unsubscribe, on: :member
  end
end
