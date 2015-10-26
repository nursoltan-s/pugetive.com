class Project < ActiveRecord::Base
  include Noteable

  TYPES = ['SoftwareApp', 'RecordingSession', 'PhotoSeries']

  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  validates :party_id, presence: true, numericality: {greater_than: 0}
  # validates :url
  validates :start_year, inclusion: {in: YEARS_OF_LIFE}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE}, allow_nil: true
  validates :live, inclusion: {in: BOOLEAN_OPTIONS}

  has_many :wields
  has_many :tools, through: :wields

  has_many :roles
  has_many :titles, through: :roles

  scope :software,    -> {where(type: 'SoftwareApp')}
  scope :music,       -> {where(type: 'RecordingSession')}
  scope :photography, -> {where(type: 'PhotoSeries')}

  scope :pro, -> {software.where("party_id != 1")}
  scope :amateur, -> {software.where(party_id: 1)}
  scope :sorted, -> {order(:name)}

  def systems
    tools.systems
  end

  def languages
    tools.languages
  end

  def programs
    tools.programs
  end

  def concepts
    tools.concepts
  end


  def date_range
    DateRange.new(start_year, stop_year).years
  end

end
