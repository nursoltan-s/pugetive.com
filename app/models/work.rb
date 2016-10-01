class Work < ApplicationRecord

  STATUSES = ['pre', 'production', 'post', 'released', 'scrapped', 'retired']

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :status, inclusion: {in: STATUSES}

  belongs_to :interest
  belongs_to :party

  has_many :roles, dependent: :destroy
  has_many :titles, through: :roles

  has_many :wields, dependent: :destroy
  has_many :tools, through: :wields

  has_many :series_works, dependent: :destroy
  has_many :series, through: :series_works

  has_one :lyric
  belongs_to :author, class_name: 'Artist'

  scope :sorted,     -> {order("stop_year IS NULL DESC, stop_year DESC")}
  scope :alpha,      -> {order(:name)}

  scope :favorite,   -> {where(favorite: true)}
  scope :unfavorite, -> {where(favorite: false)}

  scope :music,      -> {where(interest_id: MUSIC_INTEREST_ID)}
  scope :film,       -> {where(interest_id: FILM_INTEREST_ID)}

  def date_range
    DateRange.new(start_year, stop_year).years
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def music?
    interest_id == MUSIC_INTEREST_ID
  end

  def mine?
    author_id == 1
  end

  def has_lyric?
    return false unless interest_id == MUSIC_INTEREST_ID
    lyric.present?
  end
end
