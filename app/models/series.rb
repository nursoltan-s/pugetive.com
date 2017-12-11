class Series < ApplicationRecord
  TYPES = ['Album', 'Gallery', 'Collection']

  include Rangeable
  include Sluggable
  include Randomable

  validates :name, presence: true, uniqueness: true
  validates :audience, inclusion: {in: BOOLEAN_OPTIONS}

  has_many :series_works, dependent: :destroy

  has_many :works, through: :series_works
  has_many :titles, -> { uniq }, through: :works

  has_many :pieces, through: :series_works, source: :work, class_name: 'Piece'
  has_many :tools, through: :pieces

  has_attached_file(:image, Pugetive::Application.config.paperclip_image_opts)
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :alpha, -> {order(:name)}

  def self.solo
    joins(works: :party).where("works.party_id = 1 OR parties.alias = 1")
  end

  def self.live
    where(audience: true)
  end

  def image_token
    'series'
  end

  def has_image?
    image.url.present? and not image.url(:thumb).match(/missing/)
  end

  def interest
    return nil unless works.any?
    works.first.interest
  end

  def canonical_path
    "/#{interest.series_name.downcase.pluralize}/#{slug}"
  end

  def artist
    return nil unless works.any?
    works.first.party
  end

  def start_year
    works.map(&:start_year).min
  end

  def stop_year
    works.map(&:stop_year).max || Time.now.year
  end

end
