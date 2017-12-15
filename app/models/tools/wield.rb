class Wield < ActiveRecord::Base

  validates :work_id, numericality: true
  validates :tool_id, numericality: true
  validates :legacy,  inclusion: {in: BOOLEAN_OPTIONS}
  validate  :matching_interests, on: :create

  belongs_to :tool, touch: true
  belongs_to :work, touch: true


  private

    def matching_interests
      unless Tool.find(tool_id).interest_id == Work.find(work_id).interest_id
        errors.add(:tool_id, "is associated with a different Interest than the Work")
      end
    end
end
