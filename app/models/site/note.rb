class Note < ActiveRecord::Base

  validates :noteable_type, presence: true
  validates :noteable_id, presence: true
  validates :contents, presence: true

  belongs_to :noteable, polymorphic: true, touch: true

  def subject
    noteable
  end
end
