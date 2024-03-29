class Series < ApplicationRecord
  TYPES = ['Album', 'Gallery', 'Collection']

  include Imageable
  include Interesting
  include Randomable
  include Rangeable
  include Sluggable

  validates :name, presence: true, uniqueness: true
  validates :audience, inclusion: {in: BOOLEAN_OPTIONS}

  has_many :series_works, dependent: :destroy

  has_many :works, through: :series_works

  has_many :roles, through: :works
  has_many :titles, -> {group('titles.id')}, through: :roles

  has_many :wields, through: :works
  has_many :tools, -> {group('tools.id')}, through: :wields

  scope :alpha, -> {order(:name)}

  def self.solo
    joins(works: :party).where("works.party_id = 1 OR parties.alias = 1")
  end

  def self.live
    where(audience: true)
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
    @start_year ||= works.map(&:start_year).min
  end

  def stop_year
    @stop_year ||= works.map(&:stop_year).max || Time.now.year
  end

end
