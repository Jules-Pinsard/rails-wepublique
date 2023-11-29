class MesuresController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_mesure, only: %i[show update destroy]

  def index
    @mesures = Mesure.all
    @comments = Comment.all.last(10)
  end

  def show
    @mesure
  end

  def new
    @mesure = Mesure.new
  end

  def create
    @category = Category.find(params[:mesure][:category_id])
    @mesure = Mesure.new(mesures_params)
    @mesure.category = @category
    @mesure.user = current_user
    @mesure.status = "En cours de concertation"
    if @mesure.save
      redirect_to mesures_path
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
    @mesure = Mesure.find(params[:id])
  end

  def mesures_params
    params.require(:mesure).permit(:title, :content, :category_id)
  end
end
