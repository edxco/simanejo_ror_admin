class InstructorsController < ApplicationController
  before_action :require_user
  before_action :set_instructor, only: [:edit, :update, :destroy]
  before_action :set_color, only: [:new, :create, :edit, :update]
  before_action :set_transmission, only: [:new, :create, :edit, :update]

  def index
    @instructors = Instructor.paginate(:page => params[:page], :per_page => 15)
  end

  def new
    @instructor = Instructor.new
  end

  def create
    
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      flash[:notice] = "Instructor agregado correctamente"
      redirect_to instructors_path
      #redirect_to action: "index"
    else
      render 'new'
    end
  end

  def edit
  end

  def update

  end

  def destroy
    @instructor.destroy
    redirect_to instructors_path
  end

  private
  def set_color
    @color = {
      '1': 'Blanco',
      '2': 'Gris',
      '3': 'Rojo',
      '4': 'Negro',
      '5': 'Amarillo'
    }
  end

  def set_transmission
    @transmission = {
      '1': 'Estandar',
      '2': 'Automatico'
    }
  end

  def set_instructor
    @instructor = Instructor.find(params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:instructor_name, :instructor_last_name, :phone_number, :vehicle_brand, :vehicle_model, :transmission, :plate_number, :car_color, :external)
  end

end