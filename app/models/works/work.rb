class Work < ApplicationRecord

  STATUSES = ['pre', 'production', 'post', 'released', 'scrapped', 'retired']

  extend FriendlyId

  friendly_id :name, use: [:slugged, :history]

  validates :status, inclusion: {in: STATUSES}

  has_attached_file(:image, Pugetive::Application.config.paperclip_image_opts)
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  belongs_to :interest
  belongs_to :party
  belongs_to :genre

  # Refactor out
  has_one :lyric

  has_many :roles, dependent: :destroy
  has_many :titles, through: :roles

  has_many :wields, dependent: :destroy
  has_many :tools, through: :wields

  has_many :series_works, dependent: :destroy
  has_many :series, through: :series_works

  belongs_to :author, class_name: 'Artist'

  scope :sorted,     -> {order("works.stop_year IS NULL DESC, works.stop_year DESC, start_year ASC, name ASC")}
  scope :alpha,      -> {order(:name)}

  scope :favorite,    -> {where(favorite: true)}
  scope :unfavorite,  -> {where(favorite: false)}

  scope :music,       -> {where(interest_id: MUSIC_INTEREST_ID)}
  scope :film,        -> {where(interest_id: FILM_INTEREST_ID)}
  scope :photography, -> {where(interest_id: PHOTOGRAPHY_INTEREST_ID)}
  scope :writing,     -> {where(interest_id: WRITING_INTEREST_ID)}

  scope :lyrical,     -> {where("interest_id IN (#{MUSIC_INTEREST_ID},#{WRITING_INTEREST_ID})")}

  def solo?
    party_id == TODD_PARTY_ID
  end


  # Refactor OUT
  def blog?
    name =~ /blog/i
  end

  # Refactor OUT
  def camera
    return nil unless photography?
    return tools.first
  end
  # Refactor OUT
  def has_audio?
    soundcloud_id.present?
  end
  # Refactor OUT
  def has_lyric?
    unless interest_id == MUSIC_INTEREST_ID or
      interest_id == WRITING_INTEREST_ID
      return false
    end
    lyric.present?
  end



  def image_token
    'work'
  end

  def software?
    interest_id == SOFTWARE_INTEREST_ID
  end

  def music?
    interest_id == MUSIC_INTEREST_ID
  end

  def writing?
    interest_id == WRITING_INTEREST_ID
  end

  def photography?
    interest_id == PHOTOGRAPHY_INTEREST_ID
  end

  def film?
    interest_id == FILM_INTEREST_ID
  end

  def years
    date_range.years
  end

  def date_range
    DateRange.new(start_year, stop_year)
  end

  def mine?
    author_id == 1
  end

  def has_image?
    image.url.present? and not image.url(:thumb).match(/missing/)
  end

  def has_thumbnail?
    instagram_id.present? or flickr_id.present?
  end

  def daw
    self.tools.where("name like 'garageband' or name like 'protools'").first
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def active_tools
    wields.where(legacy: false).map{|w| w.tool}
  end

  def legacy_tools
    wields.where(legacy: true).map{|w| w.tool}
  end

  # REFACTOR: to Series
  def prev_in_series(series)
    location = series.works.sorted.index(self)
    if location == 0
      return series.works.sorted[series.works.length - 1]
    else
      return series.works.sorted[location - 1]
    end
  end


  def next_in_series(series)
    location = series.works.sorted.index(self)
    if location == series.works.length - 1
      return series.works.sorted[0]
    else
      return series.works.sorted[location + 1]
    end

  end


end
