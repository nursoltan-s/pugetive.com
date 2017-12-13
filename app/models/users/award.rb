class Award < ApplicationRecord

  include Rangeable
  
  validates :name, presence: true
  validates :summary, presence: true
  validates :start_year, inclusion: {in: YEARS_OF_LIFE}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE}
  validates :live, inclusion: {in: BOOLEAN_OPTIONS}

  scope :sorted, -> {order("stop_year DESC")}

  def year
    start_year
  end

  def date_range
    DateRange.new(start_year, stop_year)
  end
end
