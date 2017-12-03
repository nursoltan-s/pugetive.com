class Genre < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  validates :interest_id, inclusion: {in: Interest::INTEREST_IDS}
  validates :name, presence: true

  belongs_to :interest
  has_many :works

  scope :film,        -> {where(interest_id: FILM_INTEREST_ID)}
  scope :music,       -> {where(interest_id: MUSIC_INTEREST_ID)}
  scope :photography, -> {where(interest_id: PHOTOGRAPHY_INTEREST_ID)}
  scope :software,    -> {where(interest_id: SOFTWARE_INTEREST_ID)}
  scope :writing,     -> {where(interest_id: WRITING_INTEREST_ID)}

  scope :alpha, -> {order(:name)}

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
