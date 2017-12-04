class Tool < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

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


  # Refactor: extract into shared module
  def self.random(num = 10)
    find(self.random_id(num))
  end

  def self.random_id(num)
    if @random_ids.nil?
      sql = <<-SQL
        SELECT id
        FROM tools
      SQL
      @random_ids = ActiveRecord::Base.connection.select_values(sql)
    end
    return @random_ids.sample(num)
  end

end
