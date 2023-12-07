class MesuresController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_mesure, only: %i[show update destroy upvote]

  def index
    @page = params[:page].to_i if params[:page]
    allmesures = Mesure.includes(:user).includes(:category).all
    mesures = allmesures
    if params[:mesure].present?
      mesures = mesures.where(user: {mayor: true}) if params[:mesure][:user_id].present?
      category = Category.find(params[:mesure][:category_id]) if params[:mesure][:category_id].present?
      mesures = mesures.where(category: {name: category.name}) if params[:mesure][:category_id].present?
      mesures = mesures.where(mesures: {status: params[:mesure][:status]}) if params[:mesure][:status].present?
    end

    if params[:mesure].present?
      sens = "asc"
      sens = "desc" if params[:mesure][:content] == "Décroissant"
      mesures = mesures.order(created_at: :"#{sens}") if params[:mesure][:title] == "Date de création"
      mesures = mesures.order(cached_votes_up: :"#{sens}") if params[:mesure][:title] == "Nombre de soutien"
      mesures = mesures.order(status: :"#{sens}") if params[:mesure][:title] == "Satut"
    end
    mesures = allmesures.where(user: {mayor: true}, mesures: {status: ["En cours de concertation", "Validé"]}).order(created_at: :desc) if params[:mesures] == "maire"
    mesures = allmesures.where(status: "En cours de concertation").order(created_at: :desc) if params[:mesures] == "citoyennes"
    mesures = allmesures.where(status: "Validé").order(created_at: :desc) if params[:mesures] == "retenues"

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
