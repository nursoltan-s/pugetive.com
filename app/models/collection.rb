class Collection < Series
  has_many :pieces, through: :series_works, source: :work, class_name: 'Piece'

  scope :haiku, -> { where('name LIKE "%haiku%"') }

end