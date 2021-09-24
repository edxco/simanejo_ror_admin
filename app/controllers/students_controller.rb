class StudentsController < ApplicationController
  before_action :require_user
  before_action :set_citylist, only: [:new, :create, :edit, :update]
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    if !params[:search].nil?
      search_params = params[:search].split.map(&:capitalize)*' '
      # @students = Student.search_in_full_name(search_params).paginate()
      @students = Student.search_in_full_name(search_params).paginate(:page => params[:page], :per_page => 8)
    else
      @students = Student.all
      @students = Student.paginate(:page => params[:page], :per_page => 8)
    end
  end

  def searching
    search_params = params[:search].split.map(&:capitalize)*' '
    @students = Student.search_in_full_name(search_params)
    
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    # @student.user_id = 1
    if @student.save
      flash[:notice] = "Estudiante agregado correctamente"
      redirect_to students_path
      #redirect_to action: "index"
    else
      render 'new'
    end
  end

  def edit
    
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "Datos del estudiante actualizado"
      redirect_to students_path
    else
      render 'edit'
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_path
  end

  private

  def set_citylist
    @citylist = { '1': 'Puebla', 
        '2': 'San Andres Cholula', 
        '3': 'San Pedro Cholula', 
        '4': 'Cuautlancingo' }
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(
      :student_name, 
      :last_name, 
      :phone_number, 
      :bday, 
      :email,
      :street,
      :address, 
      :city,
      :search)
  end
end
