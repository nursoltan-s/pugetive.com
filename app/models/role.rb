class Role < ActiveRecord::Base

  validates :work_id, presence: true
  validates :title_id, presence: true

  belongs_to :work, touch: true
  belongs_to :title, touch: true

end
