class Interest < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :name, presence: true
  validates :sort, numericality: true
  validates :token, presence: true, uniqueness: true
  validates :work_name, presence: true, uniqueness: true
  validates :series_name, presence: true
  validates :icon, presence: true
  validates :public, inclusion: {in: BOOLEAN_OPTIONS}

  has_many :works

  scope :live, -> {where(public: true)}
  scope :software, -> {where(id: SOFTWARE_INTEREST_ID)}

  def self.categories
    all.map(&:name)
  end

  def self.interest_ids
    all.map(&:id)
  end

  def music?
    id == MUSIC_INTEREST_ID
  end

  def photography?
    id == PHOTOGRAPHY_INTEREST_ID
  end

  def software?
    id == SOFTWARE_INTEREST_ID
  end

  def film?
    id == FILM_INTEREST_ID
  end

  def writing?
    id == WRITING_INTEREST_ID
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end


end
