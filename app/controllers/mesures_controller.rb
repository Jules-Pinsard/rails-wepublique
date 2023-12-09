class MesuresController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_mesure, only: %i[show update destroy upvote]

  def index
    @page = params[:page].to_i if params[:page].present?
    allmesures = Mesure.includes(:user).includes(:category).all
    mesures = allmesures

    if params[:mesure].present?
      mesures = mesures.where(user: {mayor: true}) if params[:mesure][:mayor] == "1"
      category = Category.find(params[:mesure][:category_id]) if params[:mesure][:category_id].present?
      mesures = mesures.where(category: {name: category.name}) if params[:mesure][:category_id].present?
      mesures = mesures.where(mesures: {status: params[:mesure][:status]}) if params[:mesure][:status].present?
    end

    if params[:mesure].present?
      sens = "desc"
      sens = "asc" if params[:mesure][:order] == "Croissant"
      if params[:mesure][:sort_by] == "Nombre de soutien"
        mesures = mesures.order(cached_votes_up: sens.to_sym)
      elsif params[:mesure][:sort_by] == "Statut"
        mesures = mesures.order(status: sens.to_sym)
      else
        mesures = mesures.order(created_at: sens.to_sym)
      end
    end

    @pages = (1..(mesures.count / 10))

    if @page.nil?
      @mesures = mesures[0..9]
    else
      @mesures = mesures[((@page - 1) * 10)..((@page * 10) - 1)]
    end

    @comments = Comment.includes(:mesure).includes(:user).all.order(created_at: :desc).last(10)
  end

  def show
    @comments = @mesure.comments.includes(:sub_comments).order(created_at: :desc)
    @comment = Comment.new
    @sub_comment = SubComment.new
  end

  def new
    @mesure = Mesure.new
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

  def upvote
    if current_user.voted_up_on? @mesure
      @mesure.unvote_by current_user
    else
      @mesure.upvote_by current_user
    end
    mesure_upvote_html = render_to_string(partial: 'mesures/mesure_upvote_link', locals: { mesure: @mesure }, formats: :html)
    render json: { mesure_upvote_html: mesure_upvote_html }
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

  private

  def find_mesure
    @mesure = Mesure.find(params[:id])
  end

  def mesures_params
    params.require(:mesure).permit(:title, :content, :category_id)
  end
end
