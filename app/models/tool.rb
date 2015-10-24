class Tool < ActiveRecord::Base

  TYPES = ['Language', 'System', 'Program', 'Concept', 'Instrument']
  validates :name, presence: true
  validates :type, inclusion: {in: TYPES}
  validates :category, inclusion: {in: PURSUITS}
  validates :front_end, inclusion: {in: BOOLEAN_OPTIONS}

end
