class Wield < ActiveRecord::Base

  validates :work_id, numericality: true
  validates :tool_id, numericality: true
  validates :legacy,  inclusion: {in: BOOLEAN_OPTIONS}

  belongs_to :tool, touch: true
  belongs_to :work, touch: true

end
