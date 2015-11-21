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



end
