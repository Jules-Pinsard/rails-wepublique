class ObservationsController < ApplicationController
  def new
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(params_observation)
    @observation.save
    if @observation.save
      redirect_to observation_path(@observation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @observations = Observation.all
  end

  private

  def params_observation
    params.require(:observation).permit(:title, :location, :description, :dangerosity, :category)
  end
end
