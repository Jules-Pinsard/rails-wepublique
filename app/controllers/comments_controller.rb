class CommentsController < ApplicationController
  before_action :find_mesure, only: %i[create]
  before_action :find_comment, only: %i[destroy upvote downvote]

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
    redirect_to request.referer, status: :see_other
  end

  def upvote
    if current_user.voted_up_on? @comment
      @comment.unvote_by current_user
    else
      @comment.upvote_by current_user
    end
    upvote_html = render_to_string(partial: 'comments/upvote_link', locals: { comment: @comment }, formats: :html)
    downvote_html = render_to_string(partial: 'comments/downvote_link', locals: { comment: @comment }, formats: :html)
    render json: { upvote_html: upvote_html, downvote_html: downvote_html }
  end

  def downvote
    if current_user.voted_down_on? @comment
      @comment.unvote_by current_user
    else
      @comment.downvote_by current_user
    end
    upvote_html = render_to_string(partial: 'comments/upvote_link', locals: { comment: @comment }, formats: :html)
    downvote_html = render_to_string(partial: 'comments/downvote_link', locals: { comment: @comment }, formats: :html)
    render json: { upvote_html: upvote_html, downvote_html: downvote_html }
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
