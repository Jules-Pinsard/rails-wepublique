class CommentsController < ApplicationController
  before_action :find_mesure, only: %i[create destroy]
  before_action :find_comment, only: %i[destroy]

  def create
    @comment = Comment.new
    @comment.user = current_user
    @comment.mesure = @mesure
    @comment.content = params[:comment][:content]
    if @comment.save
      redirect_to @mesure, notice: 'Le commentaire a bien été envoyé.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @mesure, status: :see_other
  end

  private

  def find_mesure
    @mesure = Mesure.find(params[:mesure_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:content, :mesure_id)
  end
end
