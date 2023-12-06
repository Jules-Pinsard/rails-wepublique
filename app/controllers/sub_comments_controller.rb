class SubCommentsController < ApplicationController
  before_action :find_comment, only: %i[create]

  before_action :find_sub_comment, only: %i[destroy]

  def create
    @sub_comment = SubComment.new
    @sub_comment.user = current_user
    @sub_comment.comment = @comment
    @sub_comment.content = params[:sub_comment][:content]
    if @sub_comment.save
      redirect_to @comment.mesure, notice: 'Le commentaire a bien été envoyé.'
    end
  end

  def upvote
    @sub_comment = SubComment.find(params[:id])
    if current_user.voted_up_on? @sub_comment
      @sub_comment.unvote_by current_user
    else
      @sub_comment.upvote_by current_user
    end
    sub_upvote_html = render_to_string(partial: 'sub_comments/sub_upvote_link', locals: { sub_comment: @sub_comment }, formats: :html)
    sub_downvote_html = render_to_string(partial: 'sub_comments/sub_downvote_link', locals: { sub_comment: @sub_comment }, formats: :html)
    render json: { sub_upvote_html: sub_upvote_html, sub_downvote_html: sub_downvote_html }
  end

  def downvote
    @sub_comment = SubComment.find(params[:id])
    if current_user.voted_down_on? @sub_comment
      @sub_comment.unvote_by current_user
    else
      @sub_comment.downvote_by current_user
    end
    sub_upvote_html = render_to_string(partial: 'sub_comments/sub_upvote_link', locals: { sub_comment: @sub_comment }, formats: :html)
    sub_downvote_html = render_to_string(partial: 'sub_comments/sub_downvote_link', locals: { sub_comment: @sub_comment }, formats: :html)
    render json: { sub_upvote_html: sub_upvote_html, sub_downvote_html: sub_downvote_html }
  end

  def destroy
    @sub_comment.destroy
    redirect_to request.referer, status: :see_other
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
