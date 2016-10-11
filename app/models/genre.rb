class Genre < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  belongs_to :interest
  has_many :works

  scope :film,  -> {where(interest_id: FILM_INTEREST_ID)}
  scope :music, -> {where(interest_id: MUSIC_INTEREST_ID)}

  scope :alpha, -> {order(:name)}

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
