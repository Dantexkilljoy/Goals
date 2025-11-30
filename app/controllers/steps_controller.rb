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
    respond_to do |format|
      format.html
      format.js
    end
    @goal = @step.action_plan.goal
  end
  
  def update
    if @step.update(step_params)
      respond_to do |format|
        format.js
        format.html { redirect_to root_url, notice: "Step was successfully updated." }
        format.json { render :show, status: :ok, location: step }
      end
    else
      respond_to do |format|
        format.js
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: "Step was successfully destroyed." }
      format.json { head :no_content }
      
      format.js do
        render template: "steps/destroy"
      end
    end
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
