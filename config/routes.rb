Rails.application.routes.draw do
  root 'foo#hello'
  get 'home' => "static_pages#home"
  get 'help' => "static_pages#help"
  get 'about' => "static_pages#about"
  get 'contact' => "static_pages#contact"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  'signup' => 'users#new'
  get  'login' => 'sessions#new'
  post  'login' => 'sessions#create'
  delete  'logout' => 'sessions#destroy'
  post 'follow/:id' => 'relationships#follow', as: 'follow' 
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :tweets, only: [:create, :edit, :update, :destroy]
end