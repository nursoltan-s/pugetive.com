class Role < ActiveRecord::Base

  validates :project_id, presence: true
  validates :title_id, presence: true

  belongs_to :project, touch: true
  belongs_to :title, touch: true

end
