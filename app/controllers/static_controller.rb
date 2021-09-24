class StaticController < ApplicationController
  def home
    redirect_to students_path if logged_in?
  end
end
