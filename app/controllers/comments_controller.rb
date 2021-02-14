class CommentsController < ApplicationController
  before_action :require_login
  before_action :set_post, only: :create
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.new(comment_params.merge({ user_id: current_user.id }))
    @comment.save! ? flash[:success] = 'You have commented!' : flash[:error] = 'Problem creating comment, please try again.'

    redirect_to crew_post_path(current_user.crew, @post)
  end

  def destroy
    authorize @comment

    @comment.destroy
  end

  private

  def set_post
    @post = Post.find_by_id(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_comment
    @comment = current_user.comments.find_by(id: params[:id])
  end
end
