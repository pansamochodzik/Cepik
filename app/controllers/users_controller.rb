class UsersController < ApplicationController
  before_action :authorize_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = 'Successfully created.'
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      flash[:notice] = 'Successfully updated.'
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    flash[:notice] = 'Successfully deleted.'
    redirect_to users_path
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'Permissions denied' unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:email, :admin)
  end
end
