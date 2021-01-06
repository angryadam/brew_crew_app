class CommentsController < ApplicationController
  before_action :require_login
  before_action :set_comment, only: :destroy

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post_id = params[:post_id]

    @comment.save ? flash[:success] = 'You have commented!' : flash[:error] = 'Problem creating comment, please try again.'

    redirect_to crew_user_post_path(current_user.crew, current_user, params[:post_id])
  end

  def destroy
    authorize @comment

    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_comment
    @comment = current_user.comments.find_by(id: params[:id])
  end
end
