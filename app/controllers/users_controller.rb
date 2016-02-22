class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find( params[:id] )
  end

  def edit
    @user = User.find( params[:id])
  end

  def update
    @user = User.find( params[:id])
    if @user.update( user_params )
      flash[:notice] = "updated successfully"
      render :show
    else
      flash[:error] = "not successfully update"
      render :edit
    end
  end

  def destroy
    @user = User.find( params[:id])
    if @user.destroy
      flash[:notice] = "Destroyed successfully."
      redirect_to users_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit( :first_name, :last_name, :email )
  end
end
