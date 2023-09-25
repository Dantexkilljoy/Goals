Rails.application.routes.draw do
  root "goals#index"
  
  devise_for :users
  
  post("/insert_celebration", { :controller => "celebrations", :action => "create" })
          
  get("/celebrations", { :controller => "celebrations", :action => "index" })
  
  get("/celebrations/:path_id", { :controller => "celebrations", :action => "show" })
  
  post("/modify_celebration/:path_id", { :controller => "celebrations", :action => "update" })
  
  get("/delete_celebration/:path_id", { :controller => "celebrations", :action => "destroy" })


  
  post("/insert_step", { :controller => "steps", :action => "create" })
          
  get("/steps", { :controller => "steps", :action => "index" })
  
  get("/steps/:path_id", { :controller => "steps", :action => "show" })
  
  post("/modify_step/:path_id", { :controller => "steps", :action => "update" })
  
  get("/delete_step/:path_id", { :controller => "steps", :action => "destroy" })


  
  post("/insert_action_plan", { :controller => "action_plans", :action => "create" })
          
  get("/action_plans", { :controller => "action_plans", :action => "index" })
  
  get("/action_plans/:path_id", { :controller => "action_plans", :action => "show" })
  
  post("/modify_action_plan/:path_id", { :controller => "action_plans", :action => "update" })
  
  get("/delete_action_plan/:path_id", { :controller => "action_plans", :action => "destroy" })


  post("/insert_goal", { :controller => "goals", :action => "create" })
 
  get("/goals", { :controller => "goals", :action => "index" })
  
  get("/goals/:path_id", { :controller => "goals", :action => "show" })
  
  post("/modify_goal/:path_id", { :controller => "goals", :action => "update" })
  
  get("/delete_goal/:path_id", { :controller => "goals", :action => "destroy" })
  
end
