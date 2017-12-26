class Variant < ApplicationRecord

  include Documentable

  validates :work_id, presence: true
  validates :name,    presence: true
  validates :year, inclusion: {in: YEARS_OF_LIFE}, allow_blank: true

  belongs_to :work

end
