class UsersController < ApplicationController
before_filter :authenticate_user!
before_filter :admin_filter
  def index
    @users = User.all
  end

  def new
    @user = User.new
    @group = Group.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = "User created successfully"
      redirect_to '/users'
    else
      render 'new'
    end
  end

  def show
    begin
      @user = User.find(params[:id])
    rescue
      flash[:error] = "There is no user with this ID"
      redirect_to users_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(users_params)
      flash[:success] = "User record updated successfully"
      redirect_to @user
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
     params.require(:user).permit(:first_name, :last_name, :email, :phone, :group_id, :password, :password_confirmation, :role)
  end
end
