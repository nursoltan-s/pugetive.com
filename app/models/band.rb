class Band < Party

  SAMPLE_TRACKS = {'Lushy' => {file: "/music/lushy-bella-beretta.mp3", name: 'Bella Beretta'},
                   'An American Starlet' => {file: "/music/starlet-half-a-heart.mp3", name: 'Half a Heart'},
                   'Downpilot' => {file: "/music/downpilot-cold-street-light.mp3", name: 'Cold Street Light'},
                   'The Shiners' => {file: "/music/shiners-quantum-quandary.mp3", name: 'Quantum Quandary'},
                   'Epigene'     => {file: "/music/epigene-mechanical-charm-offensive.mp3", name: "Mechanical Charm Offensive"}}

  def has_audio?
    SAMPLE_TRACKS[self.name].present?
  end

  def sample_mp3
    SAMPLE_TRACKS[self.name][:file]
  end

  def sample_track
    SAMPLE_TRACKS[self.name][:name]
  end
end