class Role < ActiveRecord::Base

  validates :work_id, presence: true
  validates :title_id, presence: true
  validate  :matching_interests, on: :create

  belongs_to :work, touch: true
  belongs_to :title, touch: true

  private

    def matching_interests
      unless Title.find(title_id).interest_id == Work.find(work_id).interest_id
        errors.add(:title_id, "is associated with a different Interest than the Work")
      end
    end

end
