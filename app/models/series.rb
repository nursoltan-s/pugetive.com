class Series < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :series_works, dependent: :destroy
  has_many :works, through: :series_works


  def self.music
    Series.joins(:works).where(works: {interest_id: MUSIC_INTEREST_ID}).uniq
  end

  def self.photography
    Series.joins(:works).where(works: {interest_id: PHOTOGRAPHY_INTEREST_ID}).uniq
  end

  def self.band
    music - music.solo
  end

  def self.solo
    joins(works: :party).where("works.party_id = 1 OR parties.alias = 1")
  end

  def self.portfolio
    where('series.name LIKE "%portfolio%"')
  end

  def self.non_portfolio
    where('series.name NOT LIKE "%portfolio%"')
  end

  def music?
    works.where(interest_id: MUSIC_INTEREST_ID).any?
  end

  def photography?
    works.where(interest_id: PHOTOGRAPHY_INTEREST_ID).any?
  end

  def interest
    works.first.interest.token
  end

  def artist
    works.first.party
  end

  def titles
    list = []
    works.each do |work|
      work.titles.each do |title|
        unless list.include?(title)
          list << title
        end
      end
    end
    list
  end

  def instruments
    list = []
    works.each do |work|
      work.tools.instruments.each do |title|
        unless list.include?(title)
          list << title
        end
      end
    end
    list
  end

  def date_range
    DateRange.new(start_year, stop_year)
  end

  def start_year
    start = Time.now.year
    works.each do |work|
      if work.start_year < start
        start = work.start_year
      end
    end
    start
  end

  def stop_year
    stop = nil
    works.each do |work|
      if work.stop_year.present? and (stop.nil? or work.stop_year > stop)
        stop = work.stop_year
      end
    end
    stop
  end

  def years
    date_range.years
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
