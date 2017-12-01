class Series < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :series_works, dependent: :destroy
  has_many :works, through: :series_works

  has_many :photographs, through: :series_works, source: :work, class_name: 'Photograph'

  has_attached_file(:image, Pugetive::Application.config.paperclip_image_opts)
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_token
    'series'
  end

  scope :alpha, -> {order(:name)}

  def self.music
    joins(:works).where(works: {interest_id: MUSIC_INTEREST_ID}).uniq
  end

  def self.photography
    joins(:works).where(works: {interest_id: PHOTOGRAPHY_INTEREST_ID}).uniq
  end

  def self.band
    joins(works: :party).where("works.party_id != 1 AND parties.alias != 1")
  end

  def self.solo
    joins(works: :party).where("works.party_id = 1 OR parties.alias = 1")
  end

  def self.live
    where(audience: true)
  end

  def self.studio
    where(audience: false)
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

  def writing?
    works.where(interest_id: WRITING_INTEREST_ID).any?
  end

  def photography?
    works.where(interest_id: PHOTOGRAPHY_INTEREST_ID).any?
  end

  def has_image?
    image.url.present? and not image.url(:thumb).match(/missing/)
  end

  def interest
    return nil unless works.any?
    works.first.interest.token
  end

  def artist
    return nil unless works.any?
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
      work.tools.reject{|t| t.category != 'Instrument'}.each do |title|
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
