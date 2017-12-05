class Album < Series

  default_scope {includes(songs: [:titles, :tools, :party])}

  has_many :songs, through: :series_works, source: :work, class_name: 'Song'
  # has_many :titles, through: :songs
  # has_many :tools, through: :songs

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
    band.studio.uniq.sort{|a, b| b.stop_year <=> a.stop_year}
  end

  def self.solo_recordings
    solo.music.uniq.sort{|a, b| b.stop_year <=> a.stop_year}
  end

  def start_year
    songs.map(&:start_year).min
  end

  def stop_year
    songs.map(&:stop_year).max
  end

end