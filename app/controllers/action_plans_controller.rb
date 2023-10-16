class ActionPlansController < ApplicationController
  before_action :set_action_plan, only: [:show, :edit, :update, :destroy]

  def index
    @list_of_action_plans = ActionPlan.all.order({ :created_at => :desc })
  end

  def show
  end

  def new
    @action_plan = ActionPlan.new
  end

  def create
    # TODO: fix
   @action_plan = current_user.goals.order(created_at: :desc).first.action_plans.new(action_plan_params)
    if @action_plan.save
      redirect_to @action_plan
    else
      redirect_to render :edit, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update    
    if @action_plan.update(action_plan_params)
      redirect_to @action_plan
    else
      redirect_to render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    # goal_id = @action_plan.goal_id

    # TODO: handle failure
    @action_plan.destroy

    # TODO: test this works
    redirect_to goals_path(@action_plan.goal_id)
  end


  private

  def set_action_plan
    # ActionPlan.find(params[:id])
    @action_plan = current_user.action_plans.find(params[:id])
  end

  def action_plan_params
    params.require(:action_plan).permit(
      :date,
      :goal_id
    )
  end
end
