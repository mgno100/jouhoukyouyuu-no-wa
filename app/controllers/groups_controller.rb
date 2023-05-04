class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:join, :withdrawal, :show]

  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def join
    unless @group.users.exists?(current_user.id)
      @group.users << current_user
      redirect_to group_posts_path(@group.id)
    end
  end

  def withdrawal
    @group.users.delete(current_user)
    redirect_to user_path(current_user.id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
