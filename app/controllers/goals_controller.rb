class GoalsController < ApplicationController
  def index
    @list_of_incomplete_goals  = current_user.goals.all.where(progress: "incomplete").order(created_at: :desc)
    @list_of_completed_goals = current_user.goals.all.where(progress: "complete").order(created: :desc)
  end

  def show
    @the_goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to @goal
    else
      redirect_to render :edit, status: :unprocessable_entity
    end
  end

  def edit 
    @goal = Goal.find(params[:id])
  end

  def update
    @the_goal = current_user.goals.find(params[:id])

    if @the_goal.update(goal_params)
      redirect_to @the_goal
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @the_goal = current_user.goals.find(params[:id])

    @the_goal.destroy

    redirect_to goals_path
  end

  private

  def goal_params
    params.require(:goal).permit(
      :name,
      :date,
      :priorities,
      :progress
    )
  end
end
