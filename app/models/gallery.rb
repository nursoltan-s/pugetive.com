class Gallery < Series
  has_many :photos, through: :series_works, source: :work, class_name: 'Photo'

  default_scope {photography}

  def self.photography
    select("DISTINCT series.*").joins(:works).where(works: {interest_id: PHOTOGRAPHY_INTEREST_ID})
  end

  def self.portfolio
    where('series.name LIKE "%portfolio%"')
  end

  def self.non_portfolio
    where('series.name NOT LIKE "%portfolio%"')
  end


  def prev(photo)
    location = photos.sorted.index(photo)
    if location.nil?
      raise "#{photos.sorted.last.class.name} and photo #{photo.class.name}"
    end
    if location == 0
      return photos.sorted[photos.length - 1]
    else
      return photos.sorted[location - 1]
    end
  end


  def next(photo)
    location = photos.sorted.index(photo)
    if location == photos.length - 1
      return photos.sorted[0]
    else
      return photos.sorted[location + 1]
    end

  end

end