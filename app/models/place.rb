class Place < ApplicationRecord
  include Sluggable

  validates :name, presence: true

  acts_as_nested_set

  has_many :works

  scope :alpha, -> {order(:name)}

  def compound_name
    ancestors.map{|p| p.name}.join('-') + name
  end

end
