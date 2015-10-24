class DateRange

  attr_accessor :start_date, :stop_date

  def initialize(start_date, stop_date)
    @start_date = parsed(start_date)
    @stop_date = parsed(stop_date)
  end

  def years
    if stop_date and stop_date.year == start_date.year
      return start_date.year
    end
    "#{start_date.year} - #{stop_date.blank? ? 'Present' : stop_date.year}"
  end

  private

    def parsed(date_string)
      return nil if date_string.blank?

      case date_string.class.name
      when 'Fixnum'
        return Date.new(date_string)
      else
        raise "Unknown date_string class #{date_string.class}"
      end
    end

end