class Place < ApplicationRecord
  extend FriendlyId
  friendly_id :compound_name, use: [:slugged, :history]

  validates :name, presence: true

  acts_as_nested_set

  has_many :works

  scope :alpha, -> {order(:name)}



  def compound_name
    ancestors.map{|p| p.name}.join('-') + name
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
