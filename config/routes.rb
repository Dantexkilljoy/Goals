Rails.application.routes.draw do
  root "goals#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post("/insert_goal", { :controller => "goals", :action => "create" })
 
  get("/goals", { :controller => "goals", :action => "index" })
  
  get("/goals/:path_id", { :controller => "goals", :action => "show" })
  
  post("/modify_goal/:path_id", { :controller => "goals", :action => "update" })
  
  get("/delete_goal/:path_id", { :controller => "goals", :action => "destroy" })
  
end
