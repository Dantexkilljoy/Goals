class GoalsController < ApplicationController
  def index
    matching_goals = Goal.all

    @list_of_goals = matching_goals.order({ :created_at => :desc })

    render({ :template => "goals/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_goals = Goal.where({ :id => the_id })

    @the_goal = matching_goals.at(0)

    render({ :template => "goals/show" })
  end

  def create
    the_goal = Goal.new
    the_goal.name = params.fetch("query_name")
    the_goal.date = params.fetch("query_date")
    the_goal.user_id = params.fetch("query_user_id")
    the_goal.progress = params.fetch("query_progress")
    the_goal.priorities = params.fetch("query_priorities")

    if the_goal.valid?
      the_goal.save
      redirect_to("/goals", { :notice => "Goal created successfully." })
    else
      redirect_to("/goals", { :alert => the_goal.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_goal = Goal.where({ :id => the_id }).at(0)

    the_goal.name = params.fetch("query_name")
    the_goal.date = params.fetch("query_date")
    the_goal.user_id = params.fetch("query_user_id")
    the_goal.progress = params.fetch("query_progress")
    the_goal.priorities = params.fetch("query_priorities")

    if the_goal.valid?
      the_goal.save
      redirect_to("/goals/#{the_goal.id}", { :notice => "Goal updated successfully."} )
    else
      redirect_to("/goals/#{the_goal.id}", { :alert => the_goal.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_goal = Goal.where({ :id => the_id }).at(0)

    the_goal.destroy

    redirect_to("/goals", { :notice => "Goal deleted successfully."} )
  end
end
