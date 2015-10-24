class Project < ActiveRecord::Base
  TYPES = ['SoftwareApplication', 'RecordingSession', 'PhotoSeries']

  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  validates :party_id, presence: true, numericality: {greater_than: 0}
  # validates :url
  validates :start_year, inclusion: {in: YEARS_OF_LIFE}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE}
  validates :live, inclusion: {in: BOOLEAN_OPTIONS}

end
