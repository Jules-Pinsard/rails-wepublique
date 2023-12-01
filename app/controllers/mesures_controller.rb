class MesuresController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_mesure, only: %i[show update destroy]

  def index
    @page = params[:page].to_i
    allmesures = Mesure.all
    @pages = (1..(allmesures.count / 10))
    if @page.nil?
      @mesures = allmesures[0..9]
    else
      @mesures = allmesures[((@page - 1) * 10)..((@page * 10) - 1)]
    end
    @comments = Comment.all.last(10)
  end

  def show
    @comments = Comment.includes(:sub_comments).where(mesure: @mesure)
    @comment = Comment.new
    @sub_comment = SubComment.new
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
      redirect_to @mesure, success: "La mesure a bien été créée"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if current_user.mayor
      @mesure.status =  params[:m]
      @mesure.save
      redirect_to mesure_path(@mesure), success: "La mesure a bien été #{params[:m].downcase}e"
    else
      redirect_to mesure_path(@mesure), status: :unauthorized
    end
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
