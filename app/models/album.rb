class Album < Series
  # default_scope {music}

  def self.band_recordings
    band.studio.uniq.sort{|a, b| b.stop_year <=> a.stop_year}
  end

  def self.solo_recordings
    solo.music.uniq.sort{|a, b| b.stop_year <=> a.stop_year}
  end


end