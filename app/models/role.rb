class Role < ActiveRecord::Base

  validates :project_id, presence: true
  validates :title_id, presence: true

  belongs_to :project
  belongs_to :title

end
