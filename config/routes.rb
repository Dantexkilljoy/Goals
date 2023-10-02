Rails.application.routes.draw do
  root "goals#index"
  
  devise_for :users
  
  resources :goals
  resources :steps
  resources :celebrations
  resources :action_plans

end
