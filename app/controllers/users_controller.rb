class UsersController < ApplicationController



  def index
    @users = User.all
  end

  def edit
    @users = User.find(params[:id])
  end



  def update
    @users = User.find(params[:id])
    if @users.update_attributes(users_params)
      flash[:success] = "User record updated successfully"
      redirect_to @users
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Record deleted."
    redirect_to users_path
  end

private

  def users_params
    params.require(:user).permit(:group_id)
  end
end
