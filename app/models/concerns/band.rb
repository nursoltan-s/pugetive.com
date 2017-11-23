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