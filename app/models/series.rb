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
    start_year = Time.now.year
    stop_year = nil
    works.each do |work|
      if work.start_year < start_year
        start_year = work.start_year
      end
      if work.stop_year.present? and (stop_year.nil? or work.stop_year > stop_year)
        stop_year = work.stop_year
      end

    end
    return DateRange.new(start_year, stop_year).years
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
