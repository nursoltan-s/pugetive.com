class Wield < ActiveRecord::Base

  belongs_to :tool, touch: true
  belongs_to :work, touch: true
end
