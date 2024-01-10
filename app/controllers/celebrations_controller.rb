class CelebrationsController < ApplicationController
  before_action :set_celebration, only: [:show, :edit, :update, :destroy]

  def index
    matching_celebrations = current_user.celebrations
    @list_of_celebrations = matching_celebrations.order({ :created_at => :desc })
  end

  def show
  end

  def new
    @celebration = Celebration.new
  end

  def create
    @celebration = current_user.celebrations.new(celebration_params)
    if @celebration.save
      redirect_to @celebration
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @celebration.update(celebration_params)
      redirect_to @celebration
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @celebration.destroy

    redirect_to celebrations_path
  end

  private

  def set_celebration
    @celebration = current_user.celebrations.find(params[:id])
  end

  def celebration_params
    params.require(:celebration).permit(
      :activity,
      :image,
      :goal_id
    )
  end
end
