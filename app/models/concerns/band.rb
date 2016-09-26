class Band
  BANDS = [{name:        'The Shiners',
            start_year:  1998,
            stop_year:   2001,
            location:    'Seattle, WA',
            instruments: Tool.where(name: 'Bass')},
            {name:        'An American Starlet',
            start_year:  2002,
            stop_year:   2007,
            location:    'Seattle, WA',
            instruments: Tool.where("name = 'Bass' OR name='Keyboards' OR name='Acoustic Guitar'")}
          ]


  attr_accessor :location, :name, :start_year, :stop_year, :summary, :instruments

  def initialize(info)
    @name        = info[:name]
    @start_year  = info[:start_year]
    @stop_year   = info[:stop_year]
    @location    = info[:location]
    @instruments = info[:instruments]
    @summary     = info[:summary]
  end


  def artist
    Party.where(name: name).first
  end

  def date_range
    DateRange.new(start_year, stop_year).years
  end

  def self.all
    list = []
    BANDS.each do |info|
      list << Band.new(info)
    end
    list
  end

end