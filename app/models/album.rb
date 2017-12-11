class Album < Series

  default_scope {includes(songs: [:titles, :tools, :party])}

  has_many :songs, through: :series_works, source: :work, class_name: 'Song'

  def self.music
    joins(:songs)
  end

  def self.band
    music.joins(works: :party).where("works.party_id != 1 AND parties.alias != 1")
  end

  def self.studio
    music.where(audience: false)
  end

  def self.band_recordings
    cached_band_recordings
  end

  def self.solo_recordings
    cached_solo_recordings
  end

  def start_year
    songs.map(&:start_year).min
  end

  def stop_year
    songs.map(&:stop_year).max
  end

  private

    def self.cached_band_recordings
      key = "Album#cached_band_recordings:#{self.all.cache_key}"
      Cache.new(key, -> {Album.band.studio.uniq.sort{|a, b| b.stop_year <=> a.stop_year}}).value
    end

    def self.cached_solo_recordings
      key = "Album#cached_solo_recordings:#{self.all.cache_key}"
      Cache.new(key, -> {Album.solo.music.uniq.sort{|a, b| b.stop_year <=> a.stop_year}}).value
    end

end