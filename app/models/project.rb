class Project < ActiveRecord::Base
  # include Noteable

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  TYPES = ['SoftwareApp', 'RecordingSession', 'PhotoSeries']

  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  validates :party_id, presence: true, numericality: {greater_than: 0}
  # validates :url
  validates :start_year, inclusion: {in: YEARS_OF_LIFE}
  validates :stop_year, inclusion: {in: YEARS_OF_LIFE}, allow_nil: true
  validates :live, inclusion: {in: BOOLEAN_OPTIONS}

  has_many :wields, dependent: :destroy
  has_many :tools, through: :wields

  has_many :roles, dependent: :destroy
  has_many :titles, through: :roles

  belongs_to :party, touch: true

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

  def last_active_year
    if stop_year.nil?
      return Time.now.year
    end
    stop_year
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end


end
