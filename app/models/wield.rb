class Wield < ActiveRecord::Base

  belongs_to :tool
  belongs_to :project
end
