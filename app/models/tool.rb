class Tool < ActiveRecord::Base

  TYPES = ['Language', 'System', 'Program', 'Concept', 'Instrument']
  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  validates :category, inclusion: {in: PURSUITS}
  validates :front_end, inclusion: {in: BOOLEAN_OPTIONS}

  scope :sorted, -> {order(:name)}
  scope :systems, -> {where(type: 'System')}
  scope :languages, -> {where(type: 'Language')}
  scope :programs, -> {where(type: 'Program')}
  scope :concepts, -> {where(type: 'Concept')}
  scope :software, -> {where(category: 'Software')}

  has_many :wields
  has_many :projects, through: :wields


  def num_projects
    @num_projects ||= projects.count
  end


  def score
    fluency * recency
  end

  def recency
    (20 - (Time.now.year - last_used_year) * 5)
  end

  def last_used_year
    projects.map{|p| p.last_active_year}.max.to_i
  end

  # def frequency
  #   ((num_projects.to_f/ max_project_count(type)) * 3).round
  # end

  private
    # def tool_frequencies_hash(category)
    #   unless (@tool_frequencies_hash.nil? or @tool_frequencies_hash[category].nil?)
    #     return @tool_frequencies_hash[category]
    #   end
    #   @tool_frequencies_hash = {}
    #   @tool_frequencies_hash[category] = {}

    #   Tool.send(category.downcase.pluralize).each do |tool|
    #     @tool_frequencies_hash[category][tool.id] = tool.num_projects
    #   end
    #   @tool_frequencies_hash[category]
    # end

    # def max_project_count(category)
    #   tool_frequencies_hash(category).values.max
    # end
end
