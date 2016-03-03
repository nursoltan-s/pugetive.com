class Award < ApplicationRecord

  def date_range
    DateRange.new(start_year, stop_year).years
  end
end
