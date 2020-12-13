class PostsController < ApplicationController
  before_action :require_login
  before_action :get_user_crew
  before_action :set_post, except: [:index, :new, :create]

  def index
    if current_user.poster?
      @posts = current_user.posts.order(id: :desc).with_rich_text_body
    else
      @posts = @crew.posts.order(id: :desc).with_rich_text_body
    end

  end

  def new
    @post = Post.new

    authorize @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    authorize @post
    if @post.save
      flash[:success] = "\"#{@post.title}\" is now live! 🎉"
      redirect_to crew_user_posts_path(@crew, current_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
    authorize @post
  end

  def update
    authorize @post

    if @post.update(post_params)
      flash[:success] = "\"#{@post.title}\" has been updated!"
      redirect_to crew_user_posts_path(@crew, current_user)
    else
      render :edit
    end
  end

  def destroy
    authorize @post

    if @post.destroy
      flash[:notice] = "\"#{@post.title}\" has been deleted!"
      redirect_to crew_user_posts_path(@crew, current_user)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body,
                                 background_image_attributes: [:id, :image_url,
                                                               :attribution_name,
                                                               :attribution_url])
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end
