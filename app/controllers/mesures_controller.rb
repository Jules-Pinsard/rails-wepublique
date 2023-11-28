class MesuresController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_mesure, only: %i[show update destroy]

  def index
    @mesures = Mesure.all
  end

  def show
    @mesure
  end

  def new
    @mesure = Mesure.new
  end

  def create
    @mesure = Mesure.new(mesures_params)
    @mesure.user = current_user
    @mesure.status = "En cours de concertation"
    if @mesure.save
      redirect_to mesure_path(@mesure)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @mesure.update(mesures_params)
  end

  def destroy
    @mesure.destroy
  end

  private

  def find_mesure
    @mesure = Mesure.find(params[:trip_id])
  end

  def mesures_params
    params.require(:mesure).permit(:title, :content, :category)
  end
end
