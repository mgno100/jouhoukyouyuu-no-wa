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

  private

  def post_params
    params.require(:post).permit(:title, :sentence).merge(user_id: current_user.id)
  end
end
