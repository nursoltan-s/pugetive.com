class Movie < Work

  def self.favorites
    key = "Movie#favorites:#{self.all.cache_key}"
    Cache.new(key, -> {Movie.favorite}).value
  end

  def self.unfavorites
    key = "Movie#unfavorites:#{self.all.cache_key}"
    Cache.new(key, -> {Movie.unfavorite}).value
  end

end