class SeriesWork < ApplicationRecord
  belongs_to :series, touch: true
  belongs_to :work, touch: true
end
