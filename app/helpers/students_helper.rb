module StudentsHelper
  def student_course_count(student)
    sum = 0
    all_appointments = Appointment.all

    all_appointments.each do |object|
      object.student_id === student ? sum=+1 : sum
    end

    if sum > 0
      puts "Aqui"
      content_tag :div, sum, class: 'rounded-full h-4 w-4 ml-2 pt-0.5 flex items-center justify-center bg-blue-900 text-white text-xs'      
    end

  end
end
