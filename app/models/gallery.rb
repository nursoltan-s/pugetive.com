class Gallery < Series
  has_many :photos, through: :series_works, source: :work, class_name: 'Photo'

  scope :portfolio,     -> { joins(:series_works).where('series.name LIKE "%portfolio%"'    ).group('series.id') }
  scope :non_portfolio, -> { joins(:series_works).where('series.name NOT LIKE "%portfolio%"').group('series.id') }

  def self.photography
    select("DISTINCT series.*").joins(:works).where(works: {interest_id: PHOTOGRAPHY_INTEREST_ID})
  end

  def self.portfolios
    key = "Gallery#cached_porfolio:#{self.all.cache_key}"
    Cache.new(key, -> {Gallery.portfolio}).value
  end

  def self.non_portfolios
    key = "Gallery#cached_non_porfolio:#{self.all.cache_key}"
    Cache.new(key, -> {Gallery.non_portfolio}).value
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