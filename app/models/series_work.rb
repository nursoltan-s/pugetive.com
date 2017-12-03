class SeriesWork < ApplicationRecord
  belongs_to :series, touch: true
  belongs_to :work, touch: true

  belongs_to :photo,  class_name: 'Work', touch: true
  belongs_to :piece, class_name: 'Work', touch: true

  self.table_name = 'series_works'

  def self.for(series, work)
    self.find_by(series_id: series.id, work_id: work.id)
  end
end