module Rangeable
  extend ActiveSupport::Concern

  included do

    def years
      date_range.years
    end

    def date_range
      DateRange.new(start_year, stop_year)
    end

    def stop_year
      read_attribute(:stop_year) || Time.now.year
    end

  end


end

