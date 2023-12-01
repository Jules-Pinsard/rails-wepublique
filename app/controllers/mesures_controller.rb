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
    @comments = Comment.all.last(20)
  end

  def show
    @comments = Comment.includes(:sub_comments).where(mesure: @mesure)
    @comment = Comment.new
    @sub_comment = SubComment.new
  end

  def upvote
    @mesure = Mesure.find(params[:id])
    if current_user.voted_up_on? @mesure
      @mesure.unvote_by current_user
    else
      @mesure.upvote_by current_user
    end
    render json: { html: render_to_string(partial: 'mesures/upvote_link', locals: { mesure: @mesure }, formats: :html) }
  end

  def downvote
    @mesure = Mesure.find(params[:id])
    if current_user.voted_down_on? @mesure
      @mesure.unvote_by current_user
    else
      @mesure.downvote_by current_user
    end
    render json: { html: render_to_string(partial: 'mesures/downvote_link', locals: { mesure: @mesure }, formats: :html) }
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

      redirect_to @mesure
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
