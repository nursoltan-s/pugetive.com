class Award

  attr_accessor :name, :summary, :url, :live, :date_range, :official_title

  def initialize(info)
    @name = info[:name]
    @summary = info[:summary]
    @url = info[:url]
    @live = info[:live]
    @date_range = info[:date_range]
    @official_title = info[:official_title]
  end

  def live?
    live
  end

  def to_html
    Endeavor.new(self).to_html
  end

  def self.all
    [{name: 'Webby Award',
      official_title: 'Best Social Networking Site',
      summary: 'Awarded to Robot Co-op for 43things.com',
      url: 'http://webbyawards.com/winners/2005/web/general-website/social-networking/43-things/',
      live: true,
      date_range: DateRange.new(2005, 2005).years
      },
      {name: 'Bar-Raiser',
      official_title: "Recruiting",
      summary: "Initiated into Amazon's program rewarding and promoting excellence in interviewing and critiquing candidates. In that role, interviewed Web Developer candidates company-wide with absolute veto power.",
      url: nil,
      live: false,
      date_range: DateRange.new(2002, 2002).years
      },
      {name: 'Just Do It Award',
      official_title: nil,
      summary: 'Amazon internal award for displaying bias for action.',
      url: nil,
      live: false,
      date_range: DateRange.new(2000, 2000).years
      }].map{|info| Award.new(info)}
  end
end