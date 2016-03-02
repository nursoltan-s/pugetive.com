class Party < ActiveRecord::Base

  TYPES = ['Company', 'Artist']
  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  # validates :url
  validates :start_year, inclusion: {in: YEARS_OF_LIFE}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE, allow_nil: true}
  validate :stop_is_after_start

  def self.sorted
    all.sort_by{|p| p.alpha_name}
  end

  def alpha_name
    name.gsub(/^(The|A)\s+/, '')
  end

  def date_range
    DateRange.new(start_year, stop_year).years
  end

  private

    def stop_is_after_start
      return if stop_year.nil?
      if stop_year < start_year
        errors.add(:stop_year, "must be equal to or later than start year")
      end
    end

end