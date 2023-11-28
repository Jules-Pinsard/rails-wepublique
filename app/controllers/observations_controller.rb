class ObservationsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index]
  def index
    @observations = Observation.all
  end

  def new
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(observations_params)
    @observaton.user = current_user
    if @observation.save
      redirect_to observation_path(@observation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def observations_params
    params.require(:observation).permit(:title, :location, :description, :dangerosity, :category)
  end
end
