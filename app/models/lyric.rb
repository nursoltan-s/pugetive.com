class Lyric < ApplicationRecord
  validates :work_id, numericality: true
  validates :content, presence: true

  belongs_to :work
end
