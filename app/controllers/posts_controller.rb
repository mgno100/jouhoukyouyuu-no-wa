class PostsController < ApplicationController
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
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
    post.destroy
    redirect_to action: :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :sentence).merge(user_id: current_user.id)
  end
end
