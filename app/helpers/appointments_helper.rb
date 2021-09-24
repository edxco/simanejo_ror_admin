module AppointmentsHelper
  attr_accessor :course_id, :course_cost

  def income(instructor, price)
    if(instructor === true)
      price = price * 0.4
    end
    price
  end

  def week_of_year
    dateNow = Time.new.strftime("%d/%m/%Y")
    week = Date.parse(dateNow).cweek
  end

  def days_of_week
    week = week_of_year()
    year = Time.new.strftime("%Y").to_i
    start = Date.commercial(year, week, 1).to_s
    finish = Date.commercial(year, week, 7).to_s
    start.concat(" - ", finish)
  end

end