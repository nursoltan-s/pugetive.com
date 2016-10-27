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

  scope :lyrical,     -> {where("interest_id IN (#{MUSIC_INTEREST_ID},#{WRITING_INTEREST_ID})")}


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

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end


end
