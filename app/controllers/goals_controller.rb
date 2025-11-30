class GoalsController < ApplicationController
  def index
    @list_of_incomplete_goals  = current_user.goals.all.where(progress: "incomplete").order(created_at: :asc)
    @list_of_completed_goals = current_user.goals.all.where(progress: "complete").order(updated_at: :desc)
  end

  def show
    @goal = Goal.find(params[:id])
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
    @goal = current_user.goals.find(params[:id])

    if @goal.update(goal_params)
      redirect_to @goal
    else
      render :edit, status: :unprocessable_entity
    end
  end
  #this was made to redirect to root after deleting a goal due to an issue with turbo not redirecting properly and trying to pull the params in the show method after the goal was deleted
  def destroy
    @goal = current_user.goals.find(params[:id])

    @goal.destroy

    redirect_to root_url, notice: "Goal was successfully destroyed."
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
