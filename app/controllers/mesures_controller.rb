class MesuresController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_mesure, only: %i[show update destroy upvote]

  def index
    @page = params[:page].to_i if params[:page]
    allmesures = Mesure.joins(:user).where("user.mayor": true) if params[:mesures] == "maire"
    allmesures = Mesure.all if params[:mesures] == "citoyennes"
    allmesures = Mesure.where(status: "Validé") if params[:mesures] == "retenues"
    @pages = (1..(allmesures.count / 10))
    @title = "Les proposition de mesure citoyennes" if params[:mesures] == "citoyennes"
    @title = "Les mesures retenues" if params[:mesures] == "retenues"
    if current_user && current_user.mayor && params[:mesures] == "maire"
      @title = "Vos propositions de mesure"
    elsif params[:mesures] == "maire"
      @title = "Les propositions de mesure du maire "
    end
    if @page.nil?
      @mesures = allmesures[0..9]
    else
      @mesures = allmesures[((@page - 1) * 10)..((@page * 10) - 1)]
    end
    @comments = Comment.all.last(10)
  end

  def show
    # @comments = Comment.includes(:sub_comments).where(mesure: @mesure)
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
