Rails.application.routes.draw do
  root "goals#index"
  
  devise_for :users
  
  resources :goals

  resources :action_plans do
    resources :steps
  end
  resources :celebrations


end
