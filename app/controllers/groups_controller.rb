class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @groups = Group.all.order(created_at: :desc)
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

  private

  def group_params
    params.require(:group).permit(:name, :introduction, user_ids: [])
  end
end
