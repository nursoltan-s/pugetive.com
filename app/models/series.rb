class Series < ApplicationRecord

  extend FriendlyId
  include  Rangeable

  friendly_id :name, use: [:slugged, :history]

  validates :name, presence: true, uniqueness: true
  validates :audience, inclusion: {in: BOOLEAN_OPTIONS}

  has_many :series_works, dependent: :destroy

  has_many :works, through: :series_works

  has_many :songs,  through: :series_works, source: :work, class_name: 'Song'
  has_many :pieces, through: :series_works, source: :work, class_name: 'Piece'

  has_attached_file(:image, Pugetive::Application.config.paperclip_image_opts)
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def image_token
    'series'
  end

  scope :alpha, -> {order(:name)}

  def self.solo
    joins(works: :party).where("works.party_id = 1 OR parties.alias = 1")
  end

  def self.live
    where(audience: true)
  end

  # Refactor
  def self.haiku
    where('name LIKE "%haiku%"').first
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

  def start_year
    works.minimum(:start_year)
  end

  def stop_year
    works.maximum(:stop_year)
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
