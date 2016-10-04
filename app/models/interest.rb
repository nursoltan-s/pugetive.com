class Interest < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  has_many :works

  scope :live, -> {where(public: true)}


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

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end


end
