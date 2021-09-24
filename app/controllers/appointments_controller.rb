class AppointmentsController < ApplicationController
  before_action :require_user
  before_action :set_appointment, only: [:edit, :update, :show, :pdf]
  before_action :set_payment, only: [:new, :create, :edit, :update]
  before_action :set_status

  def index
    @appointments = Appointment.paginate(:page => params[:page], :per_page => 15)
    @appointments_global_sum = @appointments.map{ |x| x.course.course_cost }.sum
    # @paid_out = @appointments.map { |element| element.course.course_cost === 'Pagado'  }.count(true)
    @to_be_paid = Appointment.to_be_paid
    @paid_out = Appointment.paid_out
  end

  def new
    @appointment = Appointment.new(student_id: params[:student_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:notice] = "Curso agregado correctamente"
      redirect_to appointments_path
      #redirect_to action: "index"
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @appointment.update(appointment_params)
      flash[:notice] = "Horario actualizado correctamente"
      redirect_to appointments_path
    else
      render 'edit'
    end
  end

  def pdf
    
    html_relative = AppointmentsController.render(
    # html_relative = AppointmentsController.new.render_to_string({
      template: 'appointments/show',
      layout: 'pdf',
      locals: { :@appointment => Appointment.find(params[:id]) }
    )

    style_tag_options = [
      # { path: ActionController::Base.helpers.assets_path('stylesheets/application.scss') },
      # { path: 'app/javascript/stylesheets/application.scss' },
      { url: 'https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css' },
    ]

    base_url = "http://localhost:3000/"
    html_absolute = Grover::HTMLPreprocessor.process html_relative, base_url, "http"

    # pdf = Grover.new(html_absolute, {
    pdf = Grover.new(html_relative, {
      format: 'A4', 
      display_url: base_url,
      # style_tag_options: style_tag_options
    }).to_pdf

    # pdf = Grover.new(html_relative, { format: 'A4' }).to_pdf

    send_data pdf, type: 'application/pdf', filename: "test.pdf"
  end

  private
  def set_payment
    @paymentlist = { 
        '1': 'Efectivo', 
        '2': 'Transferencia', 
        '3': 'Deposito', 
        '4': 'Tarjeta en linea' }
  end

  def set_status
    @statuslist = { 
        '1': 'Por pagar', 
        '2': 'Pagado al instructor', 
        '3': 'Factura',
        '4': 'Pagado', 
        '5': 'Cancelado' }
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(
      :status,
      :course_id, 
      :instructor_id, 
      :student_id,
      :start_date,
      :payment_type,
      :start_time)
  end

end