class Band < Artist
  # BANDS = [
  #          {name: 'Dorothy Fell',
  #           start_year:  1990,
  #           stop_year:   1992,
  #           location:    'State College, PA',
  #           instruments: Tool.where("name = 'Bass'"),
  #           summary:     "Local alternative rock act in my college town.",
  #           url:         nil},
  #          {name: 'Coffee Shop Trio',
  #           start_year:  1992,
  #           stop_year:   1994,
  #           location:    'State College, PA',
  #           instruments: Tool.where("name = 'Acoustic Guitar'"),
  #           summary:     "Acoustic cover band featuring myself on guitar backing two female vocalists. We mostly performed songs by folky female acts of the era: Indigo Girls, etc.",
  #           url:         nil},
  #           {name:        'The Shiners',
  #           start_year:  1998,
  #           stop_year:   2001,
  #           location:    'Seattle, WA',
  #           instruments: Tool.where(name: 'Bass'),
  #           summary:     "After a brief stint in complex Seattle pop band Epigene, I went to the other end of the spectrum and got a classic country education by playing with the Shiners.  We were a bar band, playing three hour sets and getting drunks to dance in varying degrees of earnestness to old-school country.  To this day I know of no other country band which based a love song on quantum physics.  Band split when the singer/songwriter decided he was too old for the music racket, broke up the band and moved back South.",
  #           url:         nil},
  #           {name:        'An American Starlet',
  #           start_year:  2001,
  #           stop_year:   2006,
  #           location:    'Seattle, WA',
  #           instruments: Tool.where("name = 'Bass' OR name='Keyboards' OR name='Acoustic Guitar'"),
  #           summary:     "Fulfilled two life-long music dreams by going on tour with a band and recording an album that had a barcode on it.  We were critically well received but rarely ventured out of Ballard.  Eventually the singer/songwriter quit the band and moved to L.A. like a true rock star.  But not before I learned a ton of stuff about recording from him.",
  #           url:         nil},
  #           {name:        'Downpilot',
  #           start_year:  2005,
  #           stop_year:   2005,
  #           location:    'Seattle, WA',
  #           instruments: Tool.where(name: 'Bass'),
  #           summary:     "Played bass with Downpilot for a few months before their original bassist decided to rejoin.  Short stint for me and I never got to record with Downpilot, but I'm a huge fan of Paul's songs and glad I got the chance to play.",
  #           url:         "http://downpilot.com"},
  #           {name:        'Lushy',
  #           start_year:  2010,
  #           stop_year:   2010,
  #           location:    'Seattle, WA',
  #           instruments: Tool.where("name = 'Bass'"),
  #           summary:     "Joined these old friends during their stint as a ten-member live act.  Dirty little secret is that I'd never owned a suit before I gigged with this stylish band.",
  #           url:         "http://lushy.com"}

  #         ]


  # attr_accessor :location, :name, :start_year, :stop_year, :summary, :instruments, :url

  # def initialize(info)
  #   @name        = info[:name]
  #   @start_year  = info[:start_year]
  #   @stop_year   = info[:stop_year]
  #   @location    = info[:location]
  #   @instruments = info[:instruments]
  #   @summary     = info[:summary]
  #   @url         = info[:url]
  # end


  # def artist
  #   Party.where(name: name).first
  # end

  # def years
  #   date_range.years
  # end

  # def date_range
  #   DateRange.new(start_year, stop_year)
  # end

  # def self.all
  #   list = []
  #   BANDS.each do |info|
  #     list << Band.new(info)
  #   end
  #   list.sort_by{|b| -b.start_year}
  # end

end