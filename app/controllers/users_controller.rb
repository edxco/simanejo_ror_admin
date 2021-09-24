class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :require_user
  before_action :admin_user, except: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:notice] = "El usuario #{@user.username} se ha creado con exito!"
        redirect_to users_path
      else
        render 'new'
      end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Usuario actualizado correctamente"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :username_email, :password)
  end
end