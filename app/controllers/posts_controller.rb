class PostsController < ApplicationController
  before_action :require_login
  before_action :get_user_crew
  before_action :set_post, except: [:index, :new, :create, :show]
  before_action :set_live_post, only: :show


  def index
    if current_user.poster?
      @live_posts = current_user.posts.lifo.live.with_rich_text_body
      @in_progress_posts = current_user.posts.lifo.in_progress.with_rich_text_body
      @other_posts = @crew.posts.other_users_post(current_user.id).lifo.live.with_rich_text_body
    else
      @live_posts = @crew.posts.lifo.live.with_rich_text_body
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
    unsplash_download_event

    if @post.save
      flash[:success] = "\"#{@post.title}\" has been created!"
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
    unsplash_download_event

    if @post.update(post_params)
      flash[:success] = "\"#{@post.title}\" has been updated!"
      redirect_to crew_user_posts_path(@crew, current_user)
    else
      render :edit
    end
  end

  def destroy
    authorize @post

    @post.destroy
  end

  def go_live
    authorize @post

    @post.update(live: true)
    NotifyCrewOfLivePostJob.perform_later(post_id: @post.id, crew_id: @crew.id)
  end

  def archive
    authorize @post

    @post.update(archived: true)
  end

  private

  def post_params
    params.require(:post).permit(:title, :body,
                                 background_image_attributes: [:id, :image_url,
                                                               :attribution_name,
                                                               :attribution_url])
  end

  def set_post
    unless (@post = @crew.posts.includes(comments: :commented_by).find_by(id: params[:id]))
      flash[:error] = 'Unable to find that post, please verify and try again.'
      redirect_to crew_user_posts_path(@crew, current_user)
    end
  end

  def set_live_post
    # to allow posters to view before it goes live
    @post = Post.find_by(id: params[:id])
    if @post
      return if @post.posted_by == current_user
      unless @post.live?
        flash[:error] = 'Unable to find that post, please verify and try again.'
        redirect_to crew_user_posts_path(@crew, current_user)
      end
    else
      flash[:error] = 'Unable to find that post, please verify and try again.'
      redirect_to crew_user_posts_path(@crew, current_user)
    end
  end

  def unsplash_download_event
    UnsplashDownloadEventJob.perform_later(params[:unsplash_id]) if params[:unsplash_id]
  end
end
