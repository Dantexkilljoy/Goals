class CelebrationsController < ApplicationController
  def index
    matching_celebrations = Celebration.all

    @list_of_celebrations = matching_celebrations.order({ :created_at => :desc })

    render({ :template => "celebrations/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_celebrations = Celebration.where({ :id => the_id })

    @the_celebration = matching_celebrations.at(0)

    render({ :template => "celebrations/show" })
  end

  def create
    the_celebration = Celebration.new
    the_celebration.goal_id = params.fetch("query_goal_id")
    the_celebration.date = params.fetch("query_date")
    the_celebration.activity = params.fetch("query_activity")
    the_celebration.image = params.fetch("query_image")

    if the_celebration.valid?
      the_celebration.save
      redirect_to("/celebrations", { :notice => "Celebration created successfully." })
    else
      redirect_to("/celebrations", { :alert => the_celebration.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_celebration = Celebration.where({ :id => the_id }).at(0)

    the_celebration.goal_id = params.fetch("query_goal_id")
    the_celebration.date = params.fetch("query_date")
    the_celebration.activity = params.fetch("query_activity")
    the_celebration.image = params.fetch("query_image")

    if the_celebration.valid?
      the_celebration.save
      redirect_to("/celebrations/#{the_celebration.id}", { :notice => "Celebration updated successfully."} )
    else
      redirect_to("/celebrations/#{the_celebration.id}", { :alert => the_celebration.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_celebration = Celebration.where({ :id => the_id }).at(0)

    the_celebration.destroy

    redirect_to("/celebrations", { :notice => "Celebration deleted successfully."} )
  end
end
