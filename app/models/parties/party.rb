class Party < ActiveRecord::Base

  include Imageable
  include Sluggable

  TYPES = ['Company', 'Artist', 'School', 'NonProfit', 'Band']
  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  # validates :url
  validates :start_year, inclusion: {in: YEARS_OF_LIFE, allow_nil: true}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE, allow_nil: true}
  validate :stop_is_after_start
  validates :live, inclusion: {in: BOOLEAN_OPTIONS}
  validates :alias, inclusion: {in: BOOLEAN_OPTIONS}

  def self.sorted
    all.sort_by{|p| p.alpha_name}
  end

  def self.jobs
    ([NonProfit.find(FAIR_PARTY_ID)] + Company.all).sort_by{|c| (c.stop_year.blank? ? (c.start_year + 20) : c.stop_year)}.reverse
  end

  def alpha_name
    name.gsub(/^(The|A)\s+/, '')
  end

  def date_range
    DateRange.new(start_year, stop_year)
  end

  def years
    date_range.years
  end

  private

    def stop_is_after_start
      return if stop_year.nil?
      if stop_year < start_year
        errors.add(:stop_year, "must be equal to or later than start year")
      end
    end

end
