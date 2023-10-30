class StepsController < ApplicationController
  before_action :set_action_plan
  before_action :set_step, only: [:edit, :update, :destroy]
  
  def new
    @step = Step.new
  end

  def create
    @step = @action_plan.steps.new(step_params)

    if @step.save
      redirect_to @step.action_plan.goal
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end
  
  def update
    if @step.update(step_params)
      redirect_to goal_path(@step.action_plan.goal_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @step.destroy

    redirect_to @step.action_plan.goal
  end

  private

  def set_step
    @step = @action_plan.steps.find(params[:id])
  end
  
  def set_action_plan
    @action_plan = current_user.action_plans.find(params[:action_plan_id])
  end

  def step_params
    params.require(:step).permit(
      :name,
      :resources,
      :skills,
      :time_allotted,
      :status
    )
  end
end
