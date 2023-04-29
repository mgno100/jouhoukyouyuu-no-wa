class PostsController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
  end

  def new
    @post = Post.new
    @group = Group.find(params[:group_id]) 
  end
end
