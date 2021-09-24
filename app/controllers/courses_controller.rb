class CoursesController < ApplicationController
  before_action :require_user
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Curso agregado correctamente"
      redirect_to courses_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      flash[:notice] = "Curso actualizado correctamente"
      redirect_to courses_path
    else
      render 'edit'
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:course_name, :course_hours, :course_cost)
  end

end