class Tool < ActiveRecord::Base

  include Randomable
  include Sluggable

  TYPES = ['Language', 'System', 'Program', 'Concept', 'Instrument']

  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  validates :category, inclusion: {in: Interest::CATEGORIES}
  validates :front_end, inclusion: {in: BOOLEAN_OPTIONS}
  validates :fluency, numericality: true

  scope :alpha,       -> {order(:name)}
  scope :sorted,      -> {order(:sort)}
  scope :resume,      -> {where(resume: true)}

  scope :systems,     -> {where(type: 'System')}
  scope :languages,   -> {where(type: 'Language')}
  scope :programs,    -> {where(type: 'Program')}
  scope :concepts,    -> {where(type: 'Concept')}

  # Refactor chnage to interest_id and use Interesting
  scope :software,    -> {where(category: 'Software')}
  scope :music,       -> {where(category: 'Music')}
  scope :photography, -> {where(category: 'Photography')}
  scope :film,        -> {where(category: 'Film')}
  scope :writing,     -> {where(category: 'Writing')}

  scope :instruments, -> {where(type: 'Instrument')}
  scope :programs,    -> {where(type: 'Program')}

  has_many :wields, dependent: :destroy
  has_many :works, through: :wields

  def self.types
    #FIXME make direct SQL call
    all.each.map{|t| t.type}.uniq
  end

  def num_projects
    @num_projects ||= projects.count
  end

  # FIXME this column should use interest_id
  def interest
    Interest.find_by_name(category)
  end

  def score
    fluency * recency
  end

  def recency
    (20 - (Time.now.year - last_used_year) * 5)
  end

  def last_used_year
    works.map{|p| p.last_active_year}.max.to_i
  end

  def iphone?
    name.match(/iphone/i)
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def self.resume_current
    sql = <<-SQL
      SELECT tools.*, COUNT(works.id) AS num_works
      FROM tools
      LEFT JOIN wields
        ON wields.tool_id = tools.id
      LEFT JOIN works
        ON wields.work_id = works.id
      WHERE tools.resume = 1
      AND works.interest_id = 1
      AND (works.stop_year = '' OR works.stop_year IS NULL OR works.stop_year > ?)
      GROUP BY tools.id
      ORDER BY tools.name
    SQL
    Tool.find_by_sql([sql, Time.now.year - 1])
  end

  def self.resume_lapsed
    resume.alpha - resume_current
  end

end
