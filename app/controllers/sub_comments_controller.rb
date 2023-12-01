class SubCommentsController < ApplicationController
  before_action :find_comment, only: %i[create destroy]

  before_action :find_sub_mesure, only: %i[destroy]

  def create
    @sub_comment = SubComment.new
    @sub_comment.user = current_user
    @sub_comment.comment = @comment
    @sub_comment.content = params[:sub_comment][:content]
    if @sub_comment.save
      redirect_to @comment.mesure, notice: 'Le commentaire a bien été envoyé.'
    end
  end

  def destroy
    @sub_comment.destroy
    redirect_to @mesure, status: :see_other
  end

  private

  def find_comment
    @comment = Comment.find(params[:comment_id])
  end

  def find_sub_comment
    @sub_comment = SubComment.find(params[:id])
  end

  def find_mesure
    @mesure = Mesure.find(params[:mesure_id])
  end

  def sub_comments_params
    params.require(:sub_comment).permit(:content, :comment_id, :mesure_id)
  end
end
