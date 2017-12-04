module Rangeable
  extend ActiveSupport::Concern

  included do

    def years
      date_range.years
    end

    def date_range
      DateRange.new(start_year, stop_year)
    end

  end


end

