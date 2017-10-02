class Work < ApplicationRecord

  STATUSES = ['pre', 'production', 'post', 'released', 'scrapped', 'retired']

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :status, inclusion: {in: STATUSES}

  has_attached_file(:image,
                    styles: { tiny: "40x40>",
                              thumb: "100x100>",
                              small:  "300x300>",
                              medium: "600x600>",
                              large:  "1200x1200>" },
                    convert_options: "-quality 100 -strip"
                    )

  # has_attached_file :photo,
  #   :styles => {
  #     :thumb => "100x100#" },
  #   :convert_options => {
  #     :thumb => "-quality 75 -strip" }


  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


  belongs_to :interest
  belongs_to :party
  belongs_to :genre


  has_many :roles, dependent: :destroy
  has_many :titles, through: :roles

  has_many :wields, dependent: :destroy
  has_many :tools, through: :wields

  has_many :series_works, dependent: :destroy
  has_many :series, through: :series_works

  has_one :lyric
  belongs_to :author, class_name: 'Artist'

  has_many :flickr_urls

  scope :sorted,     -> {order("works.stop_year IS NULL DESC, works.stop_year DESC, start_year ASC, name ASC")}
  scope :alpha,      -> {order(:name)}

  scope :favorite,    -> {where(favorite: true)}
  scope :unfavorite,  -> {where(favorite: false)}
  scope :solo,        -> {joins(:party).where("parties.id = #{TODD_PARTY_ID} OR parties.alias = 1")}
  scope :pro,         -> {joins(:party).where("parties.id != #{TODD_PARTY_ID} AND parties.alias != 1")}
  scope :websites,    -> {where('name LIKE "%flickr%" OR name LIKE "%instagram%"')}

  scope :music,       -> {where(interest_id: MUSIC_INTEREST_ID)}
  scope :film,        -> {where(interest_id: FILM_INTEREST_ID)}
  scope :photography, -> {where(interest_id: PHOTOGRAPHY_INTEREST_ID)}

  scope :flickr,      -> {where("flickr_id IS NOT NULL AND flickr_id != ''")}

  scope :lyrical,     -> {where("interest_id IN (#{MUSIC_INTEREST_ID},#{WRITING_INTEREST_ID})")}

  scope :photo_sorted, -> {order("stop_year DESC, instagram_id DESC, flickr_id DESC")}

  def years
    date_range.years
  end

  def date_range
    DateRange.new(start_year, stop_year)
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

  def mine?
    author_id == 1
  end

  def blog?
    name =~ /blog/i
  end

  def has_lyric?
    unless interest_id == MUSIC_INTEREST_ID or
      interest_id == WRITING_INTEREST_ID
      return false
    end
    lyric.present?
  end

  def has_thumbnail?
    instagram_id.present? or flickr_id.present?
  end

  def has_audio?
    soundcloud_id.present?
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


  def camera
    return nil unless photography?
    return tools.first
  end

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


  def refresh_flickr_urls
    return unless flickr_id.present?
    # url_s : Square
    # url_q : Large Square
    # url_t : Thumbnail
    # url_m : Small
    # url_n : Small 320
    # url   : Medium
    # url_z : Medium 640
    # url_c : Medium 800
    # url_b : Large
    # url_o : Original

    FlickRaw.api_key= CONFIG[Rails.env][:flickr_api_key]
    FlickRaw.shared_secret=CONFIG[Rails.env][:flickr_secret]

    info = flickr.photos.getInfo(photo_id: flickr_id)
    [:url_q, :url, :url_b, :url_o, :url_z].each do |token|
      if url = FlickRaw.send(token, info)
        existing_row = flickr_urls.find_by_flickraw_token(token)
        if existing_row
          existing_row.update!(url: url)
        else
          FlickrUrl.create!(work_id: self.id, flickraw_token: token, url: url)
        end
      else
        raise 'failed'
      end
    end

  end

end
