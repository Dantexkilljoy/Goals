Rails.application.routes.draw do
  # Routes for the Step resource:

  # CREATE
  post("/insert_step", { :controller => "steps", :action => "create" })
          
  # READ
  get("/steps", { :controller => "steps", :action => "index" })
  
  get("/steps/:path_id", { :controller => "steps", :action => "show" })
  
  # UPDATE
  
  post("/modify_step/:path_id", { :controller => "steps", :action => "update" })
  
  # DELETE
  get("/delete_step/:path_id", { :controller => "steps", :action => "destroy" })

  #------------------------------

  # Routes for the Action plan resource:

  # CREATE
  post("/insert_action_plan", { :controller => "action_plans", :action => "create" })
          
  # READ
  get("/action_plans", { :controller => "action_plans", :action => "index" })
  
  get("/action_plans/:path_id", { :controller => "action_plans", :action => "show" })
  
  # UPDATE
  
  post("/modify_action_plan/:path_id", { :controller => "action_plans", :action => "update" })
  
  # DELETE
  get("/delete_action_plan/:path_id", { :controller => "action_plans", :action => "destroy" })

  #------------------------------

  root "goals#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post("/insert_goal", { :controller => "goals", :action => "create" })
 
  get("/goals", { :controller => "goals", :action => "index" })
  
  get("/goals/:path_id", { :controller => "goals", :action => "show" })
  
  post("/modify_goal/:path_id", { :controller => "goals", :action => "update" })
  
  get("/delete_goal/:path_id", { :controller => "goals", :action => "destroy" })
  
end
