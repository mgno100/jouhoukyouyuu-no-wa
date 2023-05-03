class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, except: [:index, :new, :create]

  def index
    @post = Post.new
    @group = Group.find(params[:group_id])
    @posts = @group.posts.includes(:user)
  end

  def new
    @post = Post.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @post = @group.posts.new(post_params)
    if @post.save
      redirect_to group_posts_path(@group)
    else
      @posts = @group.posts.includes(:user)
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
      redirect_to action: :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :sentence).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
