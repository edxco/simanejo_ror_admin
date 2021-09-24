class SessionsController < ApplicationController

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Bienvenid@ al sistema Si Manejo"
      redirect_to students_path
    else
      flash.now[:alert] = "Credenciales incorrectas"
      render 'new'
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Sistema cerrado"
    redirect_to login_path
  end

  private

  def session_params

  end
end