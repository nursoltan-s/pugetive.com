class Interest < ApplicationRecord

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  scope :live, -> {where(public: true)}


  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end


end
