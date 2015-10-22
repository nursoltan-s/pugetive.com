class Project < ActiveRecord::Base
  CATEGORIES = %w{Photography Software Music Writing}

  validates :name, presence: true
  validates :category, inclusion: {in: CATEGORIES}
  validates :live, inclusion: {in: BOOLEAN_OPTIONS}
  validates :pro, inclusion: {in: BOOLEAN_OPTIONS}
  validates :start_year, inclusion: {in: YEARS_OF_LIFE}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE}
  validate :stop_is_after_start


  private

    def stop_is_after_start
      if stop_year < start_year
        errors.add(:stop_year, "must be equal to or later than start year")
      end
    end

end
