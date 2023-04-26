class GroupsController < ApplicationController
  def index
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
