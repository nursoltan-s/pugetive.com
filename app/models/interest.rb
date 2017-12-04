class Interest < ApplicationRecord

  CATEGORIES = ['Software', 'Music', 'Photography', 'Film', 'Writing']
  INTEREST_IDS = [1, 2, 3, 4, 5]

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
