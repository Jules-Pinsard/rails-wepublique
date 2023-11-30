class SubCommentsController < ApplicationController
  before_action :find_comment, only: %i[create destroy]
  before_action :find_mesure, only: %i[create destroy]
  before_action :find_sub_mesure, only: %i[destroy]

  def create
    @sub_comment = SubComment.new
    @sub_comment.user = current_user
    @sub_comment.comment = @comment
    if @sub_comment.save
      redirect_to @mesure
    else
      render "mesure/show", status: :unprocessable_entity
    end
  end

  def destroy
    @sub_comment.destroy
    redirect_to @mesure, status: :see_other
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_sub_comment
    @sub_comment = SubComment.find(params[:id])
  end

  def find_mesure
    @mesure = Mesure.find(params[:id])
  end

  def sub_comments_params
    params.require(:sub_comments).permit(:content)
  end
end
