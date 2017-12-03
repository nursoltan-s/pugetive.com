class Album < Series
  # default_scope {music}

  def self.music
    includes(works: [:titles, :tools, :interest]).joins(:works).where(works: {interest_id: MUSIC_INTEREST_ID})
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


end