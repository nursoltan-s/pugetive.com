class SeriesWork < ApplicationRecord
  belongs_to :series, touch: true
  belongs_to :work, touch: true

  belongs_to :photograph, class_name: 'Work', touch: true
end
