class Project < ActiveRecord::Base
  TYPES = ['SoftwareApp', 'RecordingSession', 'PhotoSeries']

  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  validates :party_id, presence: true, numericality: {greater_than: 0}
  # validates :url
  validates :start_year, inclusion: {in: YEARS_OF_LIFE}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE}
  validates :live, inclusion: {in: BOOLEAN_OPTIONS}

  scope :software, -> {where(type: 'SoftwareApp')}
  scope :pro, -> {software.where("party_id != 1")}
  scope :amateur, -> {software.where(party_id: 1)}


  def date_range
    DateRange.new(start_year, stop_year).years
  end
end
