class ActionPlansController < ApplicationController
  before_action :set_action_plan, only: [:edit, :update, :destroy]

  def show
  end

  def new
    @action_plan = ActionPlan.new
  end

  def create
   @action_plan = current_user.action_plans.new(action_plan_params)
    if @action_plan.save
      redirect_to @action_plan.goal
    else
      redirect_to render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update    
    if @action_plan.update(action_plan_params)
      redirect_to goal_path(@action_plan.goal_id)
    else
      redirect_to render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @action_plan.destroy

    redirect_to @action_plan.goal
  end


  private

  def set_action_plan
    @action_plan = current_user.action_plans.find(params[:id])
  end

  def action_plan_params
    params.require(:action_plan).permit(
      :date,
      :goal_id
    )
  end
end
