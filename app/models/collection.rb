class Collection < Series

  scope :haiku, -> { where('name LIKE "%haiku%"') }

end