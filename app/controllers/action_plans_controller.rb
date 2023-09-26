class ActionPlansController < ApplicationController
  def index
    matching_action_plans = ActionPlan.all

    @list_of_action_plans = matching_action_plans.order({ :created_at => :desc })
  end

  def show
    the_id = params.fetch("path_id")

    matching_action_plans = ActionPlan.where({ :id => the_id })

    @the_action_plan = matching_action_plans.at(0)
  end

  def create
    the_action_plan = ActionPlan.new
    the_action_plan.time = params.fetch("query_time")
    the_action_plan.goal_id = params.fetch("query_goal_id")
    the_action_plan.date = params.fetch("query_date")

    if the_action_plan.valid?
      the_action_plan.save
      redirect_to("/action_plans", { :notice => "Action plan created successfully." })
    else
      redirect_to("/action_plans", { :alert => the_action_plan.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_action_plan = ActionPlan.where({ :id => the_id }).at(0)

    the_action_plan.time = params.fetch("query_time")
    the_action_plan.goal_id = params.fetch("query_goal_id")
    the_action_plan.date = params.fetch("query_date")

    if the_action_plan.valid?
      the_action_plan.save
      redirect_to("/action_plans/#{the_action_plan.id}", { :notice => "Action plan updated successfully."} )
    else
      redirect_to("/action_plans/#{the_action_plan.id}", { :alert => the_action_plan.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_action_plan = ActionPlan.where({ :id => the_id }).at(0)

    the_action_plan.destroy

    redirect_to("/action_plans", { :notice => "Action plan deleted successfully."} )
  end
end
