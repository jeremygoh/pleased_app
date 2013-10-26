class GroupsController < ApplicationController
  def index
    @group = Group.all
  end

  def new
    @group=Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "Group created successfully"
      redirect_to '/groups'
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def show
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated successfully"
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group deleted."
    redirect_to "/groups"
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end


end
