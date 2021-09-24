class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "Se requiere accesar al sistema"
      redirect_to login_path
    end
  end

  def admin_user
    if !current_user.admin == true
      flash[:notice] = "El usuario: #{current_user.username.upcase} no tiene privilegios"
      redirect_to current_user
    end
  end
end
